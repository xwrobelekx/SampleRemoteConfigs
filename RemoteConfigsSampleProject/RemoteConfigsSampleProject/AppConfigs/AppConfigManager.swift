//
//  AppConfigManager.swift
//  RemoteConfigsSampleProject
//
//  Created by Kamil Wrobel on 8/25/23.
//

import Combine
import FirebaseRemoteConfig
import UIKit

class AppConfigManager {
    
    var appConfig: AppConfig {
        guard let loadedAppConfig else {
            fatalError("App config has not been loaded.")
        }
        
        return loadedAppConfig
    }
    
    private var loadedAppConfig: AppConfig?
    private let remoteConfig = RemoteConfig.remoteConfig()
    
    init() {
        // This is just a sample so we're going to fetch configs instantly, without any delays.
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = TimeInterval(0)
        remoteConfig.configSettings = settings
    }
    
    func load() -> AnyPublisher<AppConfig, Swift.Error> {
        let remoteConfig = remoteConfig
        
        return fetchRemoteConfigs()
            // decoding remote configs from firebase
            .map { FirebaseConfigDecoder(remoteConfig: $0, source: .remote) }
            .tryMap(AppConfig.init(decoder:))
            .tryCatch { error in
                print("Failed to load remote configs, error: \(error)")
                // using default values stored locally:
                remoteConfig.setDefaults(fromPlist: "FirebaseRemoteConfigDefaults")
                
                return Just(remoteConfig)
                    // decoding default remote configs
                    .map { FirebaseConfigDecoder(remoteConfig: $0, source: .default) }
                    .tryMap(AppConfig.init(decoder:))
            }
            .map { [weak self] config in
                self?.loadedAppConfig = config
                return config
            }
            .eraseToAnyPublisher()
    }
}

// MARK: - Private
private extension AppConfigManager {
    func fetchRemoteConfigs() -> AnyPublisher<RemoteConfig, Swift.Error> {
        let remoteConfig = remoteConfig
        
        return Future { promise in
            remoteConfig.fetchAndActivate { _, error in
                if let error {
                    promise(.failure(error))
                }
                
                promise(.success(remoteConfig))
            }
        }
        .eraseToAnyPublisher()
    }
}

//
//  AppConfigs.swift
//  RemoteConfigsSampleProject
//
//  Created by Kamil Wrobel on 8/25/23.
//

import Foundation

/// An object that contains App configurations.
/// Those configurations are being fetched from Firebase.
/// There is also a Backup file named `FirebaseRemoteConfigsDefaults.plist`.
/// Be sure to add a default value to `FirebaseRemoteConfigsDefaults.plist` as you add new config parameters.
struct AppConfig {
    let isGreenScreenEnabled: Bool
    let isRedScreenEnabled: Bool
    let isYellowScreenEnabled: Bool
}

// MARK: - CodingKeys
private extension AppConfig {
    enum CodingKeys: String, CodingKey {
        case isGreenScreenEnabled = "green_screen_feature_flag"
        case isRedScreenEnabled = "red_screen_feature_flag"
        case isYellowScreenEnabled = "yellow_screen_feature_flag"
    }
}


// MARK: - Initialization
extension AppConfig {
    init(decoder: AppConfigDecoder) throws {
        let container = decoder.container(keyedBy: CodingKeys.self)
        
        isGreenScreenEnabled = try container.decodeBool(forKey: .isGreenScreenEnabled)
        isRedScreenEnabled = try container.decodeBool(forKey: .isRedScreenEnabled)
        isYellowScreenEnabled = try container.decodeBool(forKey: .isYellowScreenEnabled)
    }
}

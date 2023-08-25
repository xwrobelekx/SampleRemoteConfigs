//
//  SceneDelegate.swift
//  RemoteConfigsSampleProject
//
//  Created by Kamil Wrobel on 8/24/23.
//

import Combine
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow? = {
        UIWindow(frame: UIScreen.main.bounds)
    }()
    
    let navigationController = UINavigationController()
    var mainCoordinator: MainCoordinator?
    
    lazy var appConfigManager: AppConfigManager = {
        AppConfigManager()
    }()
    
    var cancellables: Set<AnyCancellable> = []

    func scene(_ scene: UIScene,
              willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else {
            return
        }
        
        launchSceneWith(scene: windowScene)
    }
}

// MARK: - Private App Launch
extension SceneDelegate {
    func launchSceneWith(scene: UIWindowScene) {
        setupWindow(scene: scene)
        
        // This logic should ideally be placed in App launch view model or something equivalent.
        // App configs should be loaded during app load.
        // This is implemented this way just to prove the concept.
        appConfigManager.load()
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    guard let self else { return }
                    let mainCoordinator = MainCoordinator(navigationController: self.navigationController,
                                                         appConfig: self.appConfigManager.appConfig)
                    self.mainCoordinator = mainCoordinator
                    mainCoordinator.start()
                case .failure(let error):
                    // There is nothing we can do at this time, without the configs we can't run the app.
                    // IF we get here it would be considered a programmers error, because we have default values as backup.
                    fatalError("Failed to fetch app configuration, \(error)")
                }
            } receiveValue: { _ in
                // Empty
            }
            .store(in: &cancellables)
    }
    
    func setupWindow(scene: UIWindowScene) {
        window?.windowScene = scene
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}

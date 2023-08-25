//
//  SceneDelegate.swift
//  RemoteConfigsSampleProject
//
//  Created by Kamil Wrobel on 8/24/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow? = {
        UIWindow(frame: UIScreen.main.bounds)
    }()
    
    lazy var mainCoordinator: MainCoordinator = {
        let navigationController = UINavigationController()
        return MainCoordinator(navigationController: navigationController)
    }()

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
        mainCoordinator.start()
    }
    
    func setupWindow(scene: UIWindowScene) {
        window?.windowScene = scene
        window?.rootViewController = mainCoordinator.navigationController
        window?.makeKeyAndVisible()
    }
}

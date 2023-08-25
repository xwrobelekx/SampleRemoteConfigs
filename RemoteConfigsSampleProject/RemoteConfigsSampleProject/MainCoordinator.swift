//
//  MainCoordinator.swift
//  RemoteConfigsSampleProject
//
//  Created by Kamil Wrobel on 8/24/23.
//

import SwiftUI
import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    var appConfigs: AppConfig

    init(navigationController: UINavigationController, appConfig: AppConfig) {
        self.navigationController = navigationController
        self.appConfigs = appConfig
    }
    
    func start() {
        runMainTabBar()
    }
}

//MARK: - Flows
extension MainCoordinator {
    func runMainTabBar() {
        let viewModel = MainTabViewModel(appConfig: appConfigs)
        let mainTabBar = MainTabView(viewModel: viewModel)
        let hostingViewController = UIHostingController(rootView: mainTabBar)
        
        navigationController.pushViewController(hostingViewController, animated: true)
    }
}

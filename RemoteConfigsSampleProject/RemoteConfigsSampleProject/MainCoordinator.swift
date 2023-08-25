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
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        runMainTabBar()
    }
}

//MARK: - Flows
extension MainCoordinator {
    func runMainTabBar() {
        let viewModel = MainTabViewModel()
        let mainTabBar = MainTabView(viewModel: viewModel)
        let hostingViewController = UIHostingController(rootView: mainTabBar)
        
        navigationController.pushViewController(hostingViewController, animated: true)
    }
}

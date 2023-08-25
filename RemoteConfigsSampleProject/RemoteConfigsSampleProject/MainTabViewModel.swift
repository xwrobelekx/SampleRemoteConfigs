//
//  MainTabViewModel.swift
//  RemoteConfigsSampleProject
//
//  Created by Kamil Wrobel on 8/24/23.
//

import Foundation
import SwiftUI

class MainTabViewModel: ObservableObject {
    let appConfig: AppConfig
    private(set) var tabs: [TabItem] = []
    
    init(appConfig: AppConfig) {
        self.appConfig = appConfig
        self.tabs = configureTabs()
    }
}

// MARK: - Private
private extension MainTabViewModel {
    func configureTabs() -> [TabItem] {
        var tabs: [TabItem] = []
        if appConfig.isGreenScreenEnabled {
            let tab = TabItem(title: "Green", image: Image(systemName: "g.circle.fill"), tag: 1, view: GreenScreen())
            tabs.append(tab)
        }
        
        if appConfig.isYellowScreenEnabled {
            let tab = TabItem(title: "Yellow", image: Image(systemName: "y.circle.fill"), tag: 1, view: YellowScreen())
            tabs.append(tab)
        }
        
        if appConfig.isRedScreenEnabled {
            let tab = TabItem(title: "Red", image: Image(systemName: "r.circle.fill"), tag: 1, view: RedScreen())
            tabs.append(tab)
        }
        
        return tabs
    }
}

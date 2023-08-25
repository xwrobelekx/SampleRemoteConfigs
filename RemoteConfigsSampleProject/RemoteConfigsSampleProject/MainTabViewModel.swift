//
//  MainTabViewModel.swift
//  RemoteConfigsSampleProject
//
//  Created by Kamil Wrobel on 8/24/23.
//

import Foundation

class MainTabViewModel: ObservableObject {
    var appConfig: AppConfig
    
    init(appConfig: AppConfig) {
        self.appConfig = appConfig
    }
}

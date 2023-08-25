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
    
    init(appConfig: AppConfig) {
        self.appConfig = appConfig
    }
}

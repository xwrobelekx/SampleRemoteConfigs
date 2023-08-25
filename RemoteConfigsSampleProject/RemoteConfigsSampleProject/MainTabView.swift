//
//  MainTabView.swift
//  RemoteConfigsSampleProject
//
//  Created by Kamil Wrobel on 8/24/23.
//

import SwiftUI

struct MainTabView: View {
    @ObservedObject var viewModel: MainTabViewModel
    @State private var selectedTab = 1
    
    var body: some View {
        TabView(selection: $selectedTab) {
            if viewModel.appConfig.isGreenScreenEnabled {
                GreenScreen()
                    .tabItem {
                        Image(systemName: "g.circle.fill")
                        Text("Green")
                    }.tag(1)
            }

            if viewModel.appConfig.isYellowScreenEnabled {
                YellowScreen()
                    .tabItem {
                        Image(systemName: "y.circle.fill")
                        Text("Yellow")
                    }
                    .tag(2)
            }

            if viewModel.appConfig.isRedScreenEnabled {
                RedScreen()
                    .tabItem {
                        Image(systemName: "r.circle.fill")
                        Text("Red")
                    }
                    .tag(3)
            }
            
        }.accentColor(Color.primary)
            .onAppear() {
                UITabBar.appearance().isTranslucent = false
            }
    }
}

//struct MainTabView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainTabView(viewModel: MainTabViewModel(
//            appConfig: AppConfigManager().appConfig))
//    }
//}

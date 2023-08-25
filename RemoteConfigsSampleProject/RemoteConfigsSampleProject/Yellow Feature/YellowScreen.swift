//
//  YellowScreen.swift
//  RemoteConfigsSampleProject
//
//  Created by Kamil Wrobel on 8/25/23.
//

import SwiftUI

struct YellowScreen: View {
    var body: some View {
        let gradient = Gradient(colors: [.orange, .yellow, .yellow])
        let linerGradient = LinearGradient(gradient: gradient, startPoint: .bottom, endPoint: .top)
        
        ZStack {
            linerGradient
            Text("Yellow Screen")
                .font(.largeTitle)
                .foregroundColor(.white)
        }.ignoresSafeArea()
    }
}

struct YellowScreen_Previews: PreviewProvider {
    static var previews: some View {
        YellowScreen()
    }
}

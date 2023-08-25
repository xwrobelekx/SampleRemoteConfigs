//
//  GreenScreen.swift
//  RemoteConfigsSampleProject
//
//  Created by Kamil Wrobel on 8/25/23.
//

import SwiftUI

struct GreenScreen: View {
    var body: some View {
        let gradient = Gradient(colors: [.mint, .green])
        let linerGradient = LinearGradient(gradient: gradient, startPoint: .bottom, endPoint: .top)
        
        ZStack {
            linerGradient
            Text("Green Screen")
                .font(.largeTitle)
                .foregroundColor(.white)
        }.ignoresSafeArea()
    }
}

struct GreenScreen_Previews: PreviewProvider {
    static var previews: some View {
        GreenScreen()
    }
}

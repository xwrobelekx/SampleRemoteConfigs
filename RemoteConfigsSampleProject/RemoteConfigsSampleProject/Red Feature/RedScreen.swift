//
//  RedScreen.swift
//  RemoteConfigsSampleProject
//
//  Created by Kamil Wrobel on 8/25/23.
//

import SwiftUI

struct RedScreen: View {
    var body: some View {
        let gradient = Gradient(colors: [.orange, .pink, .red, .red])
        let linerGradient = LinearGradient(gradient: gradient, startPoint: .bottom, endPoint: .top)
        
        ZStack {
            linerGradient
            Text("Red Screen")
                .font(.largeTitle)
                .foregroundColor(.white)
        }.ignoresSafeArea()
    }
}

struct RedScreen_Previews: PreviewProvider {
    static var previews: some View {
        RedScreen()
    }
}

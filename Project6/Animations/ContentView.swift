//
//  ContentView.swift
//  Animations
//
//  Created by Prathamesh Kowarkar on 05/07/20.
//

import SwiftUI

struct ContentView: View {

    @State private var animationAmount: CGFloat = 1

    var body: some View {
        Button("Tap") {
            animationAmount += 1
        }
        .padding(32)
        .background(Color.accentColor)
        .foregroundColor(.white)
        .clipShape(Circle())
        .scaleEffect(animationAmount)
        .blur(radius: (animationAmount - 1) * 2)
        .animation(.default)
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

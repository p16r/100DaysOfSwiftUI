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
        VStack {
            Stepper(
                "Scale amount: \(animationAmount)",
                value: $animationAmount.animation(
                    Animation.easeInOut(duration: 1)
                        .repeatCount(3, autoreverses: true)
                ),
                in: 1...10
            )
            Spacer()
            Button("Tap") {
                animationAmount += 1
            }
            .padding(32)
            .background(Color.accentColor)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationAmount, anchor: .bottom)
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

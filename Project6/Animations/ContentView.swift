//
//  ContentView.swift
//  Animations
//
//  Created by Prathamesh Kowarkar on 05/07/20.
//

import SwiftUI

struct CornerRotateModifier: ViewModifier {

    let amount: Double
    let anchor: UnitPoint

    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(amount), anchor: anchor)
            .clipped()
    }

}

extension AnyTransition {

    static var pivot: Self {
        .modifier(
            active: CornerRotateModifier(amount: -90, anchor: .topLeading),
            identity: CornerRotateModifier(amount: 0, anchor: .topLeading)
        )
    }

}

struct ContentView: View {

    @State private var isShowingRed = false

    var body: some View {
        VStack {
            Button("Tap") {
                withAnimation {
                    isShowingRed.toggle()
                }
            }
            if isShowingRed {
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 256, height: 256)
                    .transition(.pivot)
            }
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

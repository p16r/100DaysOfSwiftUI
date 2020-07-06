//
//  ContentView.swift
//  Animations
//
//  Created by Prathamesh Kowarkar on 05/07/20.
//

import SwiftUI

struct ContentView: View {

    let letters = Array("Hello, World!")
    @State var isEnabled = false
    @State private var dragAmount = CGSize.zero

    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<letters.count) {
                Text(String(letters[$0]))
                    .padding(6)
                    .font(.title)
                    .background(isEnabled ? Color.blue : .red)
                    .offset(dragAmount)
                    .animation(Animation.default.delay(Double($0) / 20))
            }
        }
        .gesture(
            DragGesture()
                .onChanged { dragAmount = $0.translation }
                .onEnded { _ in
                    dragAmount = .zero
                    isEnabled.toggle()
                }
        )
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

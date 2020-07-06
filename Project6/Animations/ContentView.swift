//
//  ContentView.swift
//  Animations
//
//  Created by Prathamesh Kowarkar on 05/07/20.
//

import SwiftUI

struct ContentView: View {

    @State private var isEnabled = false

    var body: some View {
        VStack {
            Button("Tap") {
                isEnabled.toggle()
            }
            .frame(width: 256, height: 256)
            .background(isEnabled ? Color.blue: Color.red)
            .animation(nil)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: isEnabled ? 64 : 0))
            .animation(.interpolatingSpring(stiffness: 10, damping: 1))
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

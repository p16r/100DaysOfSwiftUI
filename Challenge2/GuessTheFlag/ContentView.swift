//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Prathamesh Kowarkar on 08/04/20.
//  Copyright © 2020 Prathamesh Kowarkar. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    private let sixColorGradient: Gradient = Gradient(
        colors: [.green, .yellow, .orange, .red, .purple, .blue]
    )

    var body: some View {
        VStack {
            ZStack {
                LinearGradient(
                    gradient: sixColorGradient,
                    startPoint: .top,
                    endPoint: .bottom
                )
                Text("Linear Gradient")
            }
            ZStack {
                RadialGradient(
                    gradient: sixColorGradient,
                    center: .center,
                    startRadius: 20,
                    endRadius: 200
                )
                Text("Radial Gradient")
            }
            ZStack {
                AngularGradient(
                    gradient: sixColorGradient,
                    center: .center
                )
                Text("Angular Gradient")
            }
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

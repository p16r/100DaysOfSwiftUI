//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Prathamesh Kowarkar on 08/04/20.
//  Copyright © 2020 Prathamesh Kowarkar. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        VStack {
            HStack {
                Text("0")
                Text("1")
                Text("2")
            }
            HStack {
                Text("3")
                Text("4")
                Text("5")
            }
            HStack {
                Text("6")
                Text("7")
                Text("8")
            }
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

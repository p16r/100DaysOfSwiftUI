//
//  ContentView.swift
//  WeSplit
//
//  Created by Prathamesh Kowarkar on 04/04/20.
//  Copyright © 2020 Prathamesh Kowarkar. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Form {
            Section {
                Text("Hello, World!")
            }

            Section {
                Text("Hello, World!")
                Text("Hello, World!")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  Moonshot
//
//  Created by Prathamesh Kowarkar on 10/08/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(0..<100) { number in
                    NavigationLink(destination: Text("Detail \(number)")) {
                        Text("Item \(number)")
                    }
                }
            }
            .navigationTitle("SwiftUI")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  WordScramble
//
//  Created by Prathamesh Kowarkar on 27/06/20.
//

import SwiftUI

struct ContentView: View {

    let people = ["Finn", "Leia", "Luke", "Rey"]

    var body: some View {
        List(people, id: \.self) {
            Text($0)
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

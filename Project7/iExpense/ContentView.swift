//
//  ContentView.swift
//  iExpense
//
//  Created by Prathamesh Kowarkar on 15/07/20.
//

import SwiftUI

struct User {

    let firstName: String
    let lastName: String

}

struct ContentView: View {

    @State private var user = User(
        firstName: "Prathamesh",
        lastName: "Kowarkar"
    )

    var body: some View {
        Button("Save User") {
            if let data = try? JSONEncoder().encode(user) {
                UserDefaults.standard.set(data, forKey: "user")
            }
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

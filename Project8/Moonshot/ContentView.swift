//
//  ContentView.swift
//  Moonshot
//
//  Created by Prathamesh Kowarkar on 10/08/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button("Decode JSON") {

            struct User: Codable {

                let name: String
                let address: Address

                struct Address: Codable {
                    let street: String
                    let city: String
                }

            }

            let input = """
            {
                "name": "Taylor Swift",
                "address": {
                    "street": "555, Taylor Swift Avenue",
                    "city": "Nashville"
                }
            }
            """

            let data = Data(input.utf8)
            if let user = try? JSONDecoder().decode(User.self, from: data) {
                print(user.address.city)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

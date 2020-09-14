//
//  ContentView.swift
//  Cupcake Corner
//
//  Created by Prathamesh Kowarkar on 14/09/20.
//

import SwiftUI

class User: ObservableObject, Codable {

    enum CodingKeys: CodingKey {

        case name

    }

    @Published var name: String

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
    }

}

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

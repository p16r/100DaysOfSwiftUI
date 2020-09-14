//
//  ContentView.swift
//  Cupcake Corner
//
//  Created by Prathamesh Kowarkar on 14/09/20.
//

import SwiftUI

struct ContentView: View {

    @State var results = [Result]()

    var body: some View {
        List(results, id: \.trackId) { item in
            VStack(alignment: .leading) {
                Text(item.trackName)
                    .font(.headline)
                Text(item.collectionName)
            }
        }
        .onAppear(perform: loadData)
    }

    func loadData() {
        guard let url = self.url else {
            return print("Invalid URL")
        }
        let request = URLRequest(url: url)

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                return print("Fetch failed: \(error.localizedDescription)")
            }

            data
                .flatMap { data -> Response? in
                    let asdf = try? JSONDecoder().decode(Response.self, from: data)
                    return asdf
                }
                .map { response in
                    DispatchQueue.main.async {
                        self.results = response.results
                    }
                }
        }
        .resume()

    }

    private var url: URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "itunes.apple.com"
        components.path = "/search"
        components.queryItems = [
            URLQueryItem(name: "term", value: "taylor+swift"),
            URLQueryItem(name: "entity", value: "song")
        ]
        return components.url
    }

}

struct Response: Codable {

    let results: [Result]

}

struct Result: Codable {

    let trackId: Int
    let trackName: String
    let collectionName: String

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

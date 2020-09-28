//
//  ContentView.swift
//  Friendface
//
//  Created by Prathamesh Kowarkar on 28/09/20.
//

import SwiftUI

struct ContentView: View {

    @State var result: Result<[User], Error> = .success([])

    private static let url: URL = {
        let string = "https://www.hackingwithswift.com/samples/friendface.json"
        return URL(string: string)!
    } ()
    private static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    } ()

    var body: some View {
        NavigationView {
            ResultView(result: result) { users in
                List(users) { user in
                    NavigationLink(destination: UserView(user: user, users: users)) {
                        Text(user.name)
                    }
                }
            } failureContent: { error in
                VStack {
                    Text(error.localizedDescription)
                    Button("Retry", action: fetchData)
                }
            }
            .navigationBarTitle("Friendface")
        }
        .onAppear(perform: fetchData)
    }

    func fetchData() {
        URLSession.shared.dataTask(with: Self.url) { data, response, error in
            if let error = error { return result = .failure(error) }
            guard let data = data else { return result = .failure(URLError(.unknown)) }
            result = Result { try Self.decoder.decode([User].self, from: data) }
        }
        .resume()
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

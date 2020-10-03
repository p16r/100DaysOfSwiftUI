//
//  ContentView.swift
//  Friendface
//
//  Created by Prathamesh Kowarkar on 28/09/20.
//

import SwiftUI

struct ContentView: View {

    @Environment(\.managedObjectContext) var context
    @FetchRequest(entity: User.entity(), sortDescriptors: [])
    var userEntities: FetchedResults<User>
    @State var error: Error? = nil

    var body: some View {
        NavigationView {
            List(userEntities) { user in
                NavigationLink(destination: UserView(user: user)) {
                    Text(user.name)
                }
            }
            .navigationBarTitle("Friendface")
        }
        .alert(boundTo: $error) { error in
            Alert(
                title: Text("Error"),
                message: Text(error.localizedDescription),
                primaryButton: .default(Text("Retry"), action: fetchData),
                secondaryButton: .default(Text("OK"))
            )
        }
        .onAppear(perform: fetchData)
    }

    func fetchData() {
        guard userEntities.isEmpty else { return }
        let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error { return self.error = error }
            guard let data = data else { return self.error = URLError(.unknown) }
            context.perform {
                do {
                    _ = try jsonDecoder().decode([User].self, from: data)
                    try context.save()
                } catch {
                    self.error = error
                }
            }
        }
        .resume()
    }

    private func jsonDecoder() -> JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        decoder.userInfo[.managedObjectContext] = context
        return decoder
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

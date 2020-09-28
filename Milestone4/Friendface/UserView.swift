//
//  UserView.swift
//  Friendface
//
//  Created by Prathamesh Kowarkar on 28/09/20.
//

import SwiftUI

struct UserView: View {

    let user: User
    let users: [User]

    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeStyle = .none
        formatter.dateStyle = .medium
        return formatter
    } ()

    var body: some View {
        List {
            Section(header: Text("Age")) {
                Text("\(user.age)")
            }
            Section(header: Text("Registered")) {
                Text("\(user.registered, formatter: Self.dateFormatter)")
            }
            Section(header: Text("About")) {
                Text("\(user.about)")
            }
            Section(header: Text("Contact")) {
                Button(user.email) {
                    guard let url = URL(string: "mailto:\(user.email)") else {
                        return
                    }
                    UIApplication.shared.open(url)
                }
                Button(user.address) {
                    guard var components = URLComponents(string: "maps://") else { return }
                    components.queryItems = [URLQueryItem(name: "q", value: user.address)]
                    guard let url = components.url else { return }
                    UIApplication.shared.open(url)
                }
            }
            Section(header: Text("Tags")) {
                DisclosureGroup("\(user.tags.count) tag(s)") {
                    ForEach(user.tags, id: \.self) {
                        Text($0)
                    }
                }
            }
            Section(header: Text("\(user.friends.count) Friend(s)")) {
                ForEach(user.friends) { friend in
                    if let friendUser = users.first(where: { $0.id == friend.id }) {
                        NavigationLink(destination: UserView(user: friendUser, users: users)) {
                            Text(friend.name)
                        }
                    } else {
                        Text(friend.name)
                    }
                }
            }
        }
        .listStyle(GroupedListStyle())
        .navigationBarTitle(user.name)
    }

}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            UserView(user: .example, users: [])
        }
    }
}

//
//  UserView.swift
//  Friendface
//
//  Created by Prathamesh Kowarkar on 28/09/20.
//

import CoreData
import SwiftUI

struct UserView: View {

    let user: User
    @Environment(\.managedObjectContext) var context
    @State var friends: [User] = []

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
                    guard let url = URL(string: "mailto:\(user.email)") else { return }
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
                    ForEach(Array(user.tags)) { tag in
                        NavigationLink(destination: TagView(tag: tag)) {
                            Text(tag.name)
                        }
                    }
                }
            }
            Section(header: Text("Friends")) {
                ForEach(friends) { friend in
                    NavigationLink(destination: UserView(user: friend)) {
                        Text(friend.name)
                    }
                }
            }
        }
        .navigationBarTitle(user.name)
        .listStyle(GroupedListStyle())
        .onAppear {
            let request: NSFetchRequest<User> = User.fetchRequest()
            request.sortDescriptors = []
            request.predicate = NSPredicate(format: "id IN %@", user.friends.map(\.id))
            context.perform {
                if let friends = try? request.execute() {
                    self.friends = friends
                }
            }
        }
    }

}

struct UserView_Previews: PreviewProvider {

    let user: User = {
        let user = User()
        user.id = UUID()
        user.name = "Lorem Ipsum"
        user.isActive = .random()
        user.age = 30
        user.company = "Apple"
        user.email = "lipsum@example.com"
        user.address = "1234 Road Street, Something state"
        user.about = "Lorem ipsum sit dolor amet"
        user.registered = .init()
        user.tags = Set()
        user.friends = Set()
        return user
    } ()

    static var previews: some View {
        UserView(user: User())
    }

}

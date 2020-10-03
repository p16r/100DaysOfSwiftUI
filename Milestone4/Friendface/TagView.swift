//
//  TagView.swift
//  Friendface
//
//  Created by Prathamesh Kowarkar on 03/10/20.
//

import SwiftUI

struct TagView: View {

    let tag: Tag

    var body: some View {
        List {
            Section(header: Text("\(tag.users.count) User(s)")) {
                ForEach(Array(tag.users)) { user in
                    NavigationLink(destination: UserView(user: user)) {
                        Text(user.name)
                    }
                }
            }
        }
        .navigationBarTitle(tag.name)
        .listStyle(GroupedListStyle())
    }

}

struct TagView_Previews: PreviewProvider {

    static let tag = Tag()

    static var previews: some View {
        TagView(tag: tag)
    }

}

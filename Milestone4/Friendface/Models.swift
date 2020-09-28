//
//  Models.swift
//  Friendface
//
//  Created by Prathamesh Kowarkar on 28/09/20.
//

import Foundation

struct User: Identifiable, Decodable {

    let id: UUID
    let name: String
    let isActive: Bool
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
    let registered: Date
    let tags: [String]
    let friends: [Friend]

    static var example: Self {
        User(
            id: UUID(),
            name: "Lorem Ipsum",
            isActive: .random(),
            age: 30,
            company: "Apple",
            email: "lipsum@apple.com",
            address: "1234 Road Street, Something state",
            about: "Lorem ipsum sit dolor amet",
            registered: .init(),
            tags: ["lorem", "ipsum"],
            friends: [
                Friend(id: UUID(), name: "Namey McNameFace"),
                Friend(id: UUID(), name: "Namey McNameFace"),
                Friend(id: UUID(), name: "Namey McNameFace"),
                Friend(id: UUID(), name: "Namey McNameFace"),
            ]
        )
    }

}

struct Friend: Identifiable, Decodable {

    let id: UUID
    let name: String

}


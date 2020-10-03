//
//  User+CoreDataClass.swift
//  Friendface
//
//  Created by Prathamesh Kowarkar on 29/09/20.
//
//

import Foundation
import CoreData

@objc(User)
public final class User: NSManagedObject {

}

extension User: Decodable {

    public convenience init(from decoder: Decoder) throws {
        guard let context = decoder.userInfo[.managedObjectContext]
                as? NSManagedObjectContext
        else { throw DecoderConfigurationError.missingManagedObjectContext }
        self.init(context: context)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(UUID.self, forKey: "id")
        self.name = try container.decode(String.self, forKey: "name")
        self.isActive = try container.decode(Bool.self, forKey: "isActive")
        self.age = try container.decode(Int16.self, forKey: "age")
        self.company = try container.decode(String.self, forKey: "company")
        self.email = try container.decode(String.self, forKey: "email")
        self.address = try container.decode(String.self, forKey: "address")
        self.about = try container.decode(String.self, forKey: "about")
        self.registered = try container.decode(Date.self, forKey: "registered")

        self.tags = try container.decode(Set<Tag>.self, forKey: "tags")
        self.tags.forEach { $0.addToUsers(self) }

        self.friends = try container.decode(Set<Friend>.self, forKey: "friends")
        self.friends.forEach { $0.addToUsers(self) }
    }

}

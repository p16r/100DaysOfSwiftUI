//
//  User+CoreDataProperties.swift
//  Friendface
//
//  Created by Prathamesh Kowarkar on 01/10/20.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var about: String
    @NSManaged public var address: String
    @NSManaged public var age: Int16
    @NSManaged public var company: String
    @NSManaged public var email: String
    @NSManaged public var id: UUID
    @NSManaged public var isActive: Bool
    @NSManaged public var name: String
    @NSManaged public var registered: Date
    @NSManaged public var friends: Set<Friend>
    @NSManaged public var tags: Set<Tag>

}

// MARK: Generated accessors for friends
extension User {

    @objc(addFriendsObject:)
    @NSManaged public func addToFriends(_ value: Friend)

    @objc(removeFriendsObject:)
    @NSManaged public func removeFromFriends(_ value: Friend)

    @objc(addFriends:)
    @NSManaged public func addToFriends(_ values: Set<Friend>)

    @objc(removeFriends:)
    @NSManaged public func removeFromFriends(_ values: Set<Friend>)

}

// MARK: Generated accessors for tags
extension User {

    @objc(addTagsObject:)
    @NSManaged public func addToTags(_ value: Tag)

    @objc(removeTagsObject:)
    @NSManaged public func removeFromTags(_ value: Tag)

    @objc(addTags:)
    @NSManaged public func addToTags(_ values: Set<Tag>)

    @objc(removeTags:)
    @NSManaged public func removeFromTags(_ values: Set<Tag>)

}

extension User : Identifiable {

}

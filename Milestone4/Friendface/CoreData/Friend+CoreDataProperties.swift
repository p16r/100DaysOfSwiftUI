//
//  Friend+CoreDataProperties.swift
//  Friendface
//
//  Created by Prathamesh Kowarkar on 01/10/20.
//
//

import Foundation
import CoreData


extension Friend {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Friend> {
        return NSFetchRequest<Friend>(entityName: "Friend")
    }

    @NSManaged public var id: UUID
    @NSManaged public var name: String
    @NSManaged public var users: Set<User>

}

// MARK: Generated accessors for users
extension Friend {

    @objc(addUsersObject:)
    @NSManaged public func addToUsers(_ value: User)

    @objc(removeUsersObject:)
    @NSManaged public func removeFromUsers(_ value: User)

    @objc(addUsers:)
    @NSManaged public func addToUsers(_ values: Set<User>)

    @objc(removeUsers:)
    @NSManaged public func removeFromUsers(_ values: Set<User>)

}

extension Friend : Identifiable {

}

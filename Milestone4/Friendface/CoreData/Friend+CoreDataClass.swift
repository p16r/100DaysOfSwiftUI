//
//  Friend+CoreDataClass.swift
//  Friendface
//
//  Created by Prathamesh Kowarkar on 29/09/20.
//
//

import Foundation
import CoreData

@objc(Friend)
public class Friend: NSManagedObject, Decodable {

    public required convenience init(from decoder: Decoder) throws {
        guard let context = decoder.userInfo[.managedObjectContext] as? NSManagedObjectContext else {
            throw DecoderConfigurationError.missingManagedObjectContext
        }
        self.init(context: context)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(UUID.self, forKey: "id")
        self.name = try container.decode(String.self, forKey: "name")
    }

}

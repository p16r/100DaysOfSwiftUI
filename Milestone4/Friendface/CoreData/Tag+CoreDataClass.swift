//
//  Tag+CoreDataClass.swift
//  Friendface
//
//  Created by Prathamesh Kowarkar on 29/09/20.
//
//

import CoreData

@objc(Tag)
public class Tag: NSManagedObject, Decodable {

    public required convenience init(from decoder: Decoder) throws {
        guard let context = decoder.userInfo[.managedObjectContext] as? NSManagedObjectContext else {
            throw DecoderConfigurationError.missingManagedObjectContext
        }
        self.init(context: context)
        self.name = try decoder.singleValueContainer().decode(String.self)
    }

}

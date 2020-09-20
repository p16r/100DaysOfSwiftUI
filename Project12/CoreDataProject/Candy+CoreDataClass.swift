//
//  Candy+CoreDataClass.swift
//  CoreDataProject
//
//  Created by Prathamesh Kowarkar on 20/09/20.
//
//

import Foundation
import CoreData

@objc(Candy)
public class Candy: NSManagedObject {
    
    public var wrappedName: String { name ?? "Unknown Candy" }

}

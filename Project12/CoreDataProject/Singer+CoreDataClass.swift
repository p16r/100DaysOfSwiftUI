//
//  Singer+CoreDataClass.swift
//  CoreDataProject
//
//  Created by Prathamesh Kowarkar on 20/09/20.
//
//

import Foundation
import CoreData

@objc(Singer)
public class Singer: NSManagedObject {
    
    var wrappedFirstName: String {
        self.firstName ?? "Unknown"
    }
    
    var wrappedLastName: String {
        self.lastName ?? "Unknown"
    }

}

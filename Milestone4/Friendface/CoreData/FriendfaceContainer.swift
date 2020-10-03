//
//  FriendfaceContainer.swift
//  Friendface
//
//  Created by Prathamesh Kowarkar on 03/10/20.
//

import CoreData

class FriendfaceContainer: NSPersistentContainer {

    convenience init() {
        self.init(name: "Friendface")
        loadPersistentStores { (storeDescription, error) in
            guard let error = error as NSError? else { return }
            fatalError("Unresolved error \(error), \(error.userInfo)")
        }
        viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
    }

}

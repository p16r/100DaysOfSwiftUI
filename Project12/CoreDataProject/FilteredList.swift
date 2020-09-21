//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Prathamesh Kowarkar on 20/09/20.
//

import CoreData
import SwiftUI

struct FilteredList<T: NSManagedObject, Content: View>: View {
    
    var fetchRequest: FetchRequest<T>
    var content: (T) -> Content
    
    init(
        filter: (key: String, condition: Condition, value: String)? = nil,
        sortKeys: [NSSortDescriptor] = [],
        @ViewBuilder content: @escaping (T) -> Content
    ) {
        let predicate = filter.map {
            NSPredicate(
                format: "%K \($0.condition.rawValue) %@",
                $0.key,
                $0.value
            )
        }
        let sortDescriptors = sortKeys.map {
            NSSortDescriptor(key: $0.key, ascending: $0.ascending)
        }
        fetchRequest = FetchRequest(
            entity: T.entity(),
            sortDescriptors: sortDescriptors,
            predicate: predicate
        )
        self.content = content
    }
    
    var body: some View {
        List(fetchRequest.wrappedValue, id: \.self, rowContent: content)
    }
}

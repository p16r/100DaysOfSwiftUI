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
        filterKey: String,
        filterValue: String,
        @ViewBuilder content: @escaping (T) -> Content
    ) {
        fetchRequest = FetchRequest(
            entity: T.entity(),
            sortDescriptors: [],
            predicate: NSPredicate(
                format: "%K BEGINSWITH %@",
                filterKey,
                filterValue
            )
        )
        self.content = content
    }
    
    var body: some View {
        List(fetchRequest.wrappedValue, id: \.self, rowContent: content)
    }
}

//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Prathamesh Kowarkar on 20/09/20.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var context
    @State var lastNameFilter = "A"
    
    var body: some View {
        VStack {
            FilteredList(
                filterKey: "lastName",
                filterValue: lastNameFilter
            ) { (singer: Singer) in
                Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
            }
            Button("Add Examples") {
                let taylor = Singer(context: context)
                taylor.firstName = "Taylor"
                taylor.lastName = "Swift"
                
                let ed = Singer(context: context)
                ed.firstName = "Ed"
                ed.lastName = "Sheeran"
                
                let adele = Singer(context: context)
                adele.firstName = "Adele"
                adele.lastName = "Adkins"
                
                try? context.save()
            }
            Button("Show A") {
                lastNameFilter = "A"
            }
            Button("Show S") {
                lastNameFilter = "S"
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

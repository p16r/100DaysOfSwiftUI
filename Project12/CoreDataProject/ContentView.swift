//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Prathamesh Kowarkar on 20/09/20.
//

import CoreData
import SwiftUI

struct ContentView: View {

    @Environment(\.managedObjectContext) var context
    @FetchRequest(entity: Country.entity(), sortDescriptors: [])
    var countries: FetchedResults<Country>
    @State var filter: (key: String, condition: Condition, value: String)? = nil
    @State var ascending: Bool? = nil

    var sortDescriptors: [NSSortDescriptor] {
        guard let ascending = ascending else { return [] }
        return [
            NSSortDescriptor(keyPath: \Country.fullName, ascending: ascending)
        ]
    }

    var body: some View {
        FilteredList(
            filter: filter,
            sortKeys: sortDescriptors
        ) { (country: Country) in
            Text(country.fullName ?? "~")
        }
        HStack {
            VStack {
                Button("Show UK") {
                    filter = ("shortName", .beginsWith, "UK")
                    ascending = nil
                }
                Button("Show Switzerland") {
                    filter = ("shortName", .beginsWith, "CH")
                    ascending = nil
                }
            }
            VStack {
                Button("Sort A-Z") {
                    filter = nil
                    ascending = true
                }
                Button("Show Z-A") {
                    filter = nil
                    ascending = false
                }
            }
        }
        if countries.isEmpty {
            Button("Add") {
                let candy1 = Candy(context: context)
                candy1.name = "Mars"
                candy1.origin = Country(context: context)
                candy1.origin?.shortName = "UK"
                candy1.origin?.fullName = "United Kingdom"

                let candy2 = Candy(context: context)
                candy2.name = "KitKat"
                candy2.origin = Country(context: context)
                candy2.origin?.shortName = "UK"
                candy2.origin?.fullName = "United Kingdom"

                let candy3 = Candy(context: context)
                candy3.name = "Twix"
                candy3.origin = Country(context: context)
                candy3.origin?.shortName = "UK"
                candy3.origin?.fullName = "United Kingdom"

                let candy4 = Candy(context: context)
                candy4.name = "Toblerone"
                candy4.origin = Country(context: context)
                candy4.origin?.shortName = "CH"
                candy4.origin?.fullName = "Switzerland"

                try? context.save()
            }
        }
    }

}

enum Condition: String {

    case beginsWith = "BEGINSWITH"
    case endsWith = "ENDSWITH"
    case contains = "CONTAINS"

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

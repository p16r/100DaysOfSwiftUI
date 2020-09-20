//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Prathamesh Kowarkar on 20/09/20.
//

import SwiftUI

struct ContentView: View {

    @Environment(\.managedObjectContext) var context
    @FetchRequest(entity: Country.entity(), sortDescriptors: [])
    var countries: FetchedResults<Country>

    var body: some View {
        List {
            ForEach(countries, id: \.self) { country in
                Section(header: Text(country.wrappedFullName)) {
                    ForEach(country.candyArray, id: \.self) { candy in
                        Text(candy.wrappedName)
                    }
                }
            }
        }
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Prathamesh Kowarkar on 20/09/20.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var context
    @FetchRequest(
        entity: Ship.entity(),
        sortDescriptors: [],
        predicate: NSPredicate(format: "universe == %@", "Star Wars")
    ) var ships: FetchedResults<Ship>
    
    var body: some View {
        List(ships, id: \.self) { ship in
            Text(ship.name ?? "Unknown")
        }
        Button("Add Examples") {
            let ship1 = Ship(context: context)
            ship1.name = "Enterprise"
            ship1.universe = "Star Trek"
            
            let ship2 = Ship(context: context)
            ship2.name = "Defiant"
            ship2.universe = "Star Trek"
            
            let ship3 = Ship(context: context)
            ship3.name = "Millennium Falcon"
            ship3.universe = "Star Wars"
            
            let ship4 = Ship(context: context)
            ship4.name = "Executor"
            ship4.universe = "Star Ward"
            
            try? context.save()
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

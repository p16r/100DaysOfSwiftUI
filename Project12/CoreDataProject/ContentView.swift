//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Prathamesh Kowarkar on 20/09/20.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var context
    @FetchRequest(entity: Wizard.entity(), sortDescriptors: [])
    var wizards: FetchedResults<Wizard>
    
    var body: some View {
        List(wizards, id: \.self) { wizard in
            Text(wizard.name ?? "Unknown")
        }
        Button("Add") {
            let wizard = Wizard(context: context)
            wizard.name = "Harry Potter"
        }
        Button("Save") {
            
            guard context.hasChanges else { return }
            
            do {
                try context.save()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

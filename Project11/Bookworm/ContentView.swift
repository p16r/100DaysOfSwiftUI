//
//  ContentView.swift
//  Bookworm
//
//  Created by Prathamesh Kowarkar on 18/09/20.
//  Copyright © 2020 Prathamesh Kowarkar. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    @Environment(\.managedObjectContext) var context
    @FetchRequest(entity: Book.entity(), sortDescriptors: [])
    var books: FetchedResults<Book>

    @State private var showingAddScreen = false

    var body: some View {
        NavigationView {
            Text("Count: \(books.count)")
                .navigationBarTitle("Bookworm")
                .navigationBarItems(
                    trailing: Button {
                        showingAddScreen = true
                    } label: {
                        Image(systemName: "plus")
                    }
                )
                .sheet(isPresented: $showingAddScreen) {
                    AddBookView()
                        .environment(\.managedObjectContext, context)
                }
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

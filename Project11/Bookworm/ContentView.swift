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
    @FetchRequest(
        entity: Book.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Book.title, ascending: true),
            NSSortDescriptor(keyPath: \Book.author, ascending: true),
        ]
    ) var books: FetchedResults<Book>

    @State private var showingAddScreen = false

    var body: some View {
        NavigationView {
            List {
                ForEach(books, id: \.self) { book in
                    NavigationLink(destination: BookDetailView(book: book)) {
                        EmojiRatingView(rating: book.rating)
                            .font(.largeTitle)
                        VStack(alignment: .leading) {
                            Text(book.title ?? "Unknown title")
                                .font(.headline)
                                .foregroundColor(
                                    book.rating == 1 ? .red : .primary
                                )
                            Text(book.author ?? "Unknown author")
                        }
                    }
                }
                .onDelete(perform: deleteBooks)
            }
            .navigationBarTitle("Bookworm")
            .navigationBarItems(
                leading: EditButton(),
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

    func deleteBooks(at offsets: IndexSet) {
        offsets.forEach { context.delete(books[$0]) }
        try? context.save()
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  AddBookView.swift
//  Bookworm
//
//  Created by Prathamesh Kowarkar on 18/09/20.
//  Copyright © 2020 Prathamesh Kowarkar. All rights reserved.
//

import SwiftUI
import CoreData

struct AddBookView: View {

    @Environment(\.managedObjectContext) var context
    @Environment(\.presentationMode) var presentationMode
    @State var isShowingAlert = false

    @State private var title = ""
    @State private var author = ""
    @State private var genre = ""
    @State private var review = ""
    @State private var rating = 3

    let genres = [
        "Fantasy",
        "Horror",
        "Kids",
        "Mystery",
        "Poetry",
        "Romance",
        "Thriller",
    ]

    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name of the book", text: $title)
                    TextField("Author of the book", text: $author)
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) { genre in
                            Text(genre)
                        }
                    }
                }
                Section {
                    RatingView(rating: $rating)
                    TextField("Write a review", text: $review)
                }
                Section {
                    Button("Save") {
                        guard genres.firstIndex(of: genre) != nil else {
                            return isShowingAlert = true
                        }

                        let newBook = Book(context: context)
                        newBook.title = title
                        newBook.author = author
                        newBook.rating = Int16(rating)
                        newBook.genre = genre
                        newBook.review = review
                        newBook.date = Date()
                        try? context.save()

                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
            .navigationBarTitle("Add a book")
            .alert(isPresented: $isShowingAlert) {
                Alert(
                    title: Text("Error"),
                    message: Text("Select a genre."),
                    dismissButton: .default(Text("OK")))
            }
        }
    }

}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}

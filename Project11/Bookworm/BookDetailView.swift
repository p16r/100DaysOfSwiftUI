//
//  BookDetailView.swift
//  Bookworm
//
//  Created by Prathamesh Kowarkar on 19/09/20.
//  Copyright © 2020 Prathamesh Kowarkar. All rights reserved.
//

import SwiftUI
import CoreData

struct BookDetailView: View {

    let book: Book
    let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeStyle = .none
        formatter.dateStyle = .long
        return formatter
    } ()

    @Environment(\.managedObjectContext) var context
    @Environment(\.presentationMode) var presentationMode
    @State var isShowingDeleteAlert = false

    var body: some View {
        GeometryReader { proxy in
            VStack {
                ZStack(alignment: .bottomTrailing) {
                    Image(book.genre ?? "Fantasy")
                        .frame(maxWidth: proxy.size.width)
                    Text(book.genre?.uppercased() ?? "FANTASY")
                        .font(.caption)
                        .fontWeight(.black)
                        .padding(8)
                        .foregroundColor(.white)
                        .background(Color.black.opacity(0.75))
                        .clipShape(Capsule())
                        .offset(x: -16, y: -8)
                }
                Text(book.author ?? "Unknown author")
                    .font(.title)
                    .foregroundColor(.secondary)
                Text(book.review ?? "No Review")
                    .padding()
                Text("\(book.date ?? Date(), formatter: formatter)")
                    .padding()
                RatingView(rating: .constant(Int(book.rating)))
                    .font(.largeTitle)
                Spacer()
            }
        }
        .alert(isPresented: $isShowingDeleteAlert) {
            Alert(
                title: Text("Delete Book"),
                message: Text("Are you sure?"),
                primaryButton: .cancel(),
                secondaryButton: .destructive(
                    Text("Delete"),
                    action: deleteBook
                )
            )
        }
        .navigationBarTitle(
            Text(book.title ?? "Unknown book"),
            displayMode: .inline
        )
        .navigationBarItems(
            trailing: Button(
                action: { isShowingDeleteAlert = true },
                label: { Image(systemName: "trash").foregroundColor(.red) }
            )
        )
    }

    func deleteBook() {
        context.delete(book)
        try? context.save()
        presentationMode.wrappedValue.dismiss()
    }

}

struct BookDetailView_Previews: PreviewProvider {

    static let context = NSManagedObjectContext(
        concurrencyType: .mainQueueConcurrencyType
    )

    static var previews: some View {
        let book = Book(context: context)
        book.title = "Test book"
        book.author = "Test author"
        book.genre = "Fantasy"
        book.rating = 4
        book.title = "This is a great book; I really enjoyed it!"
        return NavigationView {
            BookDetailView(book: book)
        }
    }

}

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
    @FetchRequest(entity: Student.entity(), sortDescriptors: [])
    var students: FetchedResults<Student>

    var body: some View {
        VStack {
            List {
                ForEach(students, id: \.id) { student in
                    Text(student.name ?? "Unknown")
                }
            }
            Button("Add") {
                let firstNames = ["Ginny", "Harry", "Hermione", "Luna", "Ron"]
                let lastNames = ["Granger", "Lovegood", "Potter", "Weasley"]
                let chosenFirstName = firstNames.randomElement()!
                let chosenLastName = lastNames.randomElement()!
                let student = Student(context: context)
                student.id = UUID()
                student.name = "\(chosenFirstName) \(chosenLastName)"
                try? context.save()
            }
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

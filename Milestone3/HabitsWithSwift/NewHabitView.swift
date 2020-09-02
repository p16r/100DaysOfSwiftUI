//
//  NewHabitView.swift
//  HabitsWithSwift
//
//  Created by Prathamesh Kowarkar on 02/09/20.
//

import SwiftUI

struct NewHabitView: View {

    @State var title = ""
    @State var description = ""
    @State var isShowingAlert = false
    @State var errorMessage: String? = nil
    @Environment(\.presentationMode) var presentationMode
    let saveAction: ((Habit) -> Void)?

    init(saveAction: ((Habit) -> Void)? = nil) {
        self.saveAction = saveAction
    }

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text(title.isEmpty ? "" : "Title")) {
                    TextField("Title", text: $title)
                }
                Section(
                    header: Text(description.isEmpty ? "" : "Description")
                ) {
                    TextField("Description", text: $description)
                }
            }
            .navigationTitle("New Habit")
            .navigationBarItems(
                trailing: Button("Save") {
                    if title.isEmpty {
                        return errorMessage = "Title cannot be empty."
                    } else if description.isEmpty {
                        return errorMessage = "Description cannot be empty."
                    }
                    saveAction?(Habit(title, description))
                    presentationMode.wrappedValue.dismiss()
                }
            )
        }
        .alert(boundTo: $errorMessage) { message in
            Alert(
                title: Text("Error"),
                message: Text(message),
                dismissButton: .default(Text("OK"))
            )
        }
    }

}

struct NewHabitView_Previews: PreviewProvider {
    static var previews: some View {
        NewHabitView()
    }
}

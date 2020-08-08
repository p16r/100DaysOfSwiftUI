//
//  NewExpense.swift
//  iExpense
//
//  Created by Prathamesh Kowarkar on 16/07/20.
//

import SwiftUI

struct NewExpense: View {

    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var expenses: Expenses
    @State var name = ""
    @State var type = "Personal"
    @State var amount = ""
    @State var isShowingError = false

    private static let types = ["Personal", "Business"]

    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                Picker("Type", selection: $type) {
                    ForEach(Self.types, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                TextField("Amount", text: $amount)
                    .keyboardType(.numberPad)
            }
            .alert(isPresented: $isShowingError) {
                Alert(
                    title: Text("Error"),
                    message: Text("You entered an incorrect amount."),
                    dismissButton: .default(Text("Try Again")) {
                        amount = ""
                    }
                )
            }
            .navigationTitle("New Expense")
            .navigationBarItems(
                trailing: Button("Save") {
                    guard let amount = Int(amount) else {
                        isShowingError = true
                        return
                    }
                    expenses.items.append(
                        ExpenseItem(name: name, type: type, amount: amount)
                    )
                    presentationMode.wrappedValue.dismiss()
                }
            )
        }
    }

}

struct NewExpense_Previews: PreviewProvider {
    static var previews: some View {
        NewExpense(expenses: Expenses())
    }
}

//
//  NewExpense.swift
//  iExpense
//
//  Created by Prathamesh Kowarkar on 16/07/20.
//

import SwiftUI

struct NewExpense: View {

    @ObservedObject var expenses: Expenses
    @State var name = ""
    @State var type = "Personal"
    @State var amount = ""

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
            .navigationTitle("New Expense")
        }
    }

}

struct NewExpense_Previews: PreviewProvider {
    static var previews: some View {
        NewExpense(expenses: Expenses())
    }
}

//
//  ContentView.swift
//  iExpense
//
//  Created by Prathamesh Kowarkar on 15/07/20.
//

import SwiftUI

struct ExpenseItem {

    let name: String
    let type: String
    let amount: Int

}

class Expenses: ObservableObject {

    @Published var items: [ExpenseItem] = []

}

struct ContentView: View {

    @ObservedObject var expenses = Expenses()

    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items, id: \.name) {
                    Text($0.name)
                }
                .onDelete { indexSet in
                    expenses.items.remove(atOffsets: indexSet)
                }
            }
            .navigationTitle("iExpense")
            .navigationBarItems(
                trailing: Button {
                    let expense = ExpenseItem(name: "Name", type: "Type", amount: 5)
                    expenses.items.append(expense)
                } label: {
                    Image(systemName: "plus")
                }
            )
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

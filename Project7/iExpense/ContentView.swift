//
//  ContentView.swift
//  iExpense
//
//  Created by Prathamesh Kowarkar on 15/07/20.
//

import SwiftUI

struct ExpenseItem: Identifiable, Codable {

    let id: UUID
    let name: String
    let type: String
    let amount: Int

    init(name: String, type: String, amount: Int) {
        self.id = UUID()
        self.name = name
        self.type = type
        self.amount = amount
    }

}

class Expenses: ObservableObject {

    @Published var items: [ExpenseItem] = [] {
        didSet {
            if let data = try? JSONEncoder().encode(items) {
                UserDefaults.standard.setValue(data, forKey: "Items")
            }
        }
    }

    init() {
        if let items = UserDefaults.standard.data(forKey: "Items").flatMap(
            { try? JSONDecoder().decode([ExpenseItem].self, from: $0) }
        ) {
            self.items = items
        } else {
            self.items = []
        }
    }

}

struct ContentView: View {

    @ObservedObject var expenses = Expenses()
    @State var isShowingNewExpense = false

    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) { expense in
                    ExpenseView(expense: expense)
                }
                    .onDelete(perform: removeExpense)
            }
            .navigationTitle("iExpense")
            .navigationBarItems(trailing: saveButton)
            .sheet(isPresented: $isShowingNewExpense) {
                NewExpense(expenses: expenses)
            }
        }
    }

    private var saveButton: some View {
        Button {
            isShowingNewExpense = true
        } label: {
            Image(systemName: "plus")
        }
    }

    private func removeExpense(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }

}

struct ExpenseView: View {

    let expense: ExpenseItem

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(expense.name)
                    .font(.headline)
                Text(expense.type)
                    .font(.subheadline)
            }
            Spacer()
            Text("$\(expense.amount)")
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

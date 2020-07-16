//
//  ContentView.swift
//  iExpense
//
//  Created by Prathamesh Kowarkar on 15/07/20.
//

import SwiftUI

struct ExpenseItem: Identifiable {

    let id = UUID()
    let name: String
    let type: String
    let amount: Int

}

class Expenses: ObservableObject {

    @Published var items: [ExpenseItem] = []

}

struct ContentView: View {

    @ObservedObject var expenses = Expenses()
    @State var isShowingNewExpense = false

    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) {
                    Text($0.name)
                }
                .onDelete { indexSet in
                    expenses.items.remove(atOffsets: indexSet)
                }
            }
            .navigationTitle("iExpense")
            .navigationBarItems(
                trailing: Button {
                    isShowingNewExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            )
            .sheet(isPresented: $isShowingNewExpense) {
                NewExpense(expenses: expenses)
            }
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

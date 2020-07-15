//
//  ContentView.swift
//  iExpense
//
//  Created by Prathamesh Kowarkar on 15/07/20.
//

import SwiftUI

struct ContentView: View {

    @State var numbers: [Int] = []
    @State private var currentNumber = 1

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(numbers, id: \.self) {
                        Text(String(describing: $0))
                    }
                    .onDelete { indexSet in
                        numbers.remove(atOffsets: indexSet)
                    }
                }
                Button("Add number") {
                    numbers.append(currentNumber)
                    currentNumber += 1
                }
            }
            .navigationBarItems(trailing: EditButton())
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  WeSplit
//
//  Created by Prathamesh Kowarkar on 04/04/20.
//  Copyright © 2020 Prathamesh Kowarkar. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2

    private let tipPercentages = [10, 15, 20, 25, 0]

    var totalPerPerson: Double { grandTotal / Double(numberOfPeople + 2) }

    var grandTotal: Double {
        let tipPercentage = Double(tipPercentages[self.tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        return orderAmount * (1 + tipPercentage / 100)
    }

    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                }
                Section(header: Text("How much tip do you want to leave?")) {
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Total amount")) {
                    Text("$\(grandTotal, specifier: "%.2f")")
                }
                Section(header: Text("Amount per person")) {
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
            }
            .navigationBarTitle("WeSplit")
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

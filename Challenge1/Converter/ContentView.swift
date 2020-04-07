//
//  ContentView.swift
//  Converter
//
//  Created by Prathamesh Kowarkar on 07/04/20.
//  Copyright © 2020 Prathamesh Kowarkar. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    @State private var inputValue = "1"
    @State private var inputUnit = 1
    @State private var outputUnit = 1

    // Conversion mapping of each unit to metres
    private let units: KeyValuePairs<String, Double> = [
        "mm": 0.001,
        "m": 1,
        "km": 1000,
        "in": 0.0254,
        "ft": 0.3048,
        "mi": 1609.344,
    ]

    private var outputValue: Double {
        guard let input = Double(inputValue) else { return 0 }
        return input * units[inputUnit].value / units[outputUnit].value
    }

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Input")) {
                    TextField("Value", text: $inputValue)
                    Picker("Unit", selection: $inputUnit) {
                        ForEach(0..<units.count) {
                            Text(self.units[$0].key)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Output")) {
                    Picker("Unit", selection: $outputUnit) {
                        ForEach(0..<units.count) {
                            Text(self.units[$0].key)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    Text(String(describing: outputValue))
                }
            }
            .navigationBarTitle("Converter")
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

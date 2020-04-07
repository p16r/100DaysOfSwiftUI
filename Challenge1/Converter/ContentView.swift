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

    private let units: [UnitLength] = [
        .millimeters,
        .meters,
        .kilometers,
        .inches,
        .feet,
        .miles,
        .astronomicalUnits,
        .lightyears,
    ]

    private var measurementFormatter: MeasurementFormatter = {
        let formatter = MeasurementFormatter()
        formatter.unitOptions = .providedUnit
        formatter.unitStyle = .long
        return formatter
    } ()

    private var outputValue: String {
        guard let input = Double(inputValue) else { return "" }
        return measurementFormatter.string(
            from: Measurement(value: input, unit: units[inputUnit])
                .converted(to: units[outputUnit])
        )
    }

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Input")) {
                    TextField("Value", text: $inputValue)
                    Picker("Unit", selection: $inputUnit) {
                        ForEach(0..<units.count) {
                            Text(self.units[$0].symbol)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Output")) {
                    Picker("Unit", selection: $outputUnit) {
                        ForEach(0..<units.count) {
                            Text(self.units[$0].symbol)
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

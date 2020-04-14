//
//  ContentView.swift
//  BetterRest
//
//  Created by Prathamesh Kowarkar on 14/04/20.
//  Copyright © 2020 Prathamesh Kowarkar. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    @State private var wakeUp = Date()

    var body: some View {
        DatePicker(
            "Please enter a date: ",
            selection: $wakeUp,
            in: Date()...
        )
            .labelsHidden()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

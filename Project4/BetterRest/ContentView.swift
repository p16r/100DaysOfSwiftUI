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
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return Text(formatter.string(from: Date()))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

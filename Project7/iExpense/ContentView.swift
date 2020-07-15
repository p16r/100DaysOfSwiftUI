//
//  ContentView.swift
//  iExpense
//
//  Created by Prathamesh Kowarkar on 15/07/20.
//

import SwiftUI

struct ContentView: View {

    @State private var tapCount = UserDefaults.standard.integer(forKey: "taps")

    var body: some View {
        Button("Taps: \(tapCount)") {
            tapCount += 1
            UserDefaults.standard.set(tapCount, forKey: "taps")
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

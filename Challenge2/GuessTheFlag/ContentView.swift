//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Prathamesh Kowarkar on 08/04/20.
//  Copyright © 2020 Prathamesh Kowarkar. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    @State private var isShowingAlert = false

    var body: some View {
        Button("Show Alert") {
            self.isShowingAlert = true
        }
        .alert(isPresented: $isShowingAlert) { () -> Alert in
            Alert(
                title: Text("Hello SwiftUI"),
                message: Text("Lorem ipsum dolor sit amet."),
                dismissButton: .default(Text("OK"))
            )
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

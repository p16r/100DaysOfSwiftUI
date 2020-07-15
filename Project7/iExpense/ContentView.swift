//
//  ContentView.swift
//  iExpense
//
//  Created by Prathamesh Kowarkar on 15/07/20.
//

import SwiftUI

struct SecondView: View {

    @Environment(\.presentationMode) var presentationMode

    let name: String

    var body: some View {
        VStack {
            Text("Hello, \(name)!")
            Button("Dismiss") {
                presentationMode.wrappedValue.dismiss()
            }
        }
    }

}

struct ContentView: View {

    @State var isShowingSheet = false

    var body: some View {
        Button("Show Sheet") {
            isShowingSheet = true
        }
        .sheet(isPresented: $isShowingSheet) {
            SecondView(name: "@prtmshk")
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

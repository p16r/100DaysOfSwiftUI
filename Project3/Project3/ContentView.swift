//
//  ContentView.swift
//  Project3
//
//  Created by Prathamesh Kowarkar on 11/04/20.
//  Copyright © 2020 Prathamesh Kowarkar. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    let motto1 = Text("Draco")
    let motto2 = Text("dormiens")
        .font(.system(.body, design: .monospaced))
    var motto3: some View {
        Text("nunquam")
            .font(.system(.body, design: .serif))
    }
    var motto4: some View = {
        Text("titillandus")
            .font(.system(.body, design: .rounded))
    } ()

    var body: some View {
        HStack {
            motto1
            motto2
            motto3
            motto4
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

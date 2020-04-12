//
//  ContentView.swift
//  Project3
//
//  Created by Prathamesh Kowarkar on 11/04/20.
//  Copyright © 2020 Prathamesh Kowarkar. All rights reserved.
//

import SwiftUI

struct Title: ViewModifier {

    let text: String

    func body(content: Content) -> some View {
        VStack {
            Text(text)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.blue)
            content
        }
    }

}

extension View {

    func title(_ title: String) -> some View {
        modifier(Title(text: title))
    }

}

struct ContentView: View {

    var body: some View {
        Text("Hello, world!")
            .title("Title")
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

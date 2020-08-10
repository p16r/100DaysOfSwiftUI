//
//  ContentView.swift
//  Moonshot
//
//  Created by Prathamesh Kowarkar on 10/08/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            GeometryReader { proxy in
                Image("Image")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: proxy.size.width)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

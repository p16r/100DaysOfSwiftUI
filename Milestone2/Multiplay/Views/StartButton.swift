//
//  StartButton.swift
//  Multiplay
//
//  Created by Prathamesh Kowarkar on 12/07/20.
//

import SwiftUI

struct StartButton: View {

    let action: () -> Void

    var body: some View {
        Button("START", action: action)
            .font(Font.largeTitle.bold())
            .foregroundColor(.white)
            .padding()
            .background(Color.orange)
            .cornerRadius(16)
            .padding()
    }

}

//
//  GameOverView.swift
//  Multiplay
//
//  Created by Prathamesh Kowarkar on 12/07/20.
//

import SwiftUI

struct GameOverView: View {

    let score: Int
    let restartAction: () -> Void

    var body: some View {
        VStack(spacing: 16) {
            Text("Your score is: \(score)")
                .font(Font.largeTitle.bold())
            Button("Play Again?", action: restartAction)
        }
            .padding(.top)
    }

}

struct GameOverView_Previews: PreviewProvider {
    static var previews: some View {
        GameOverView(score: 0, restartAction: {})
    }
}

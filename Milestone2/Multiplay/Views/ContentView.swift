//
//  ContentView.swift
//  Multiplay
//
//  Created by Prathamesh Kowarkar on 09/07/20.
//

import SwiftUI

struct ContentView: View {

    @State private var multiplicand = 1
    @State private var numberOfQuestions = 0
    @State private var isGameStarted = false

    var body: some View {
        Group {
            if isGameStarted {
                QuestionsView(
                    multiplicand: multiplicand,
                    numberOfQuestions: numberOfQuestions
                )
                Button("Quit", action: quitGame)
                    .padding()
                Spacer()
            } else {
                VStack(spacing: 16) {
                    MultiplicandSelectionView(multiplicand: $multiplicand)
                    QuestionsCountView(questionsCount: $numberOfQuestions)
                    StartButton(action: newGame)
                        .disabled(if: numberOfQuestions == 0)
                }
                    .padding()
            }
        }
            .font(.largeTitle)
    }

    private func newGame() {
        isGameStarted = true
    }

    private func quitGame() {
        isGameStarted = false
    }

}

struct ContentView_Previews: PreviewProvider {

    static var previews: some View {
        ContentView()
    }

}

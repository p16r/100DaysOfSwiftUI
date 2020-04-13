//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Prathamesh Kowarkar on 13/04/20.
//  Copyright © 2020 Prathamesh Kowarkar. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    @State private var moves = ["💎", "📄", "✂️"]
    @State private var shouldWin = Bool.random()
    @State private var isShowingAlert = false
    @State private var questionCount = 0
    @State private var appChoice = Int.random(in: 0 ..< 3)
    @State private var score = 0
    private let maxQuestions = 10

    var body: some View {
        NavigationView {
            VStack(spacing: 40) {
                HStack(spacing: 40) {
                    CaptionView(title: "App's move:", text: moves[appChoice])
                    CaptionView(
                        title: "Player should:",
                        text: shouldWin ? "Win" : "Lose"
                    )
                }
                HStack(spacing: 40) {
                    ForEach(0 ..< moves.count) { move in
                        Button(
                            action: {
                                self.didTapButton(at: move)
                            }
                        ) {
                            Text(self.moves[move])
                                .font(.largeTitle)
                                .foregroundColor(.white)
                                .padding(8)
                                .background(Color.blue)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        }
                    }
                }
                CaptionView(
                    title: "Your score:",
                    text: String(describing: score)
                )
            }
            .navigationBarTitle("Rock Paper Scissors")
            .alert(isPresented: $isShowingAlert) {
                Alert(
                    title: Text("Game Complete"),
                    message: Text("Your score is: \(score)"),
                    dismissButton: .default(Text("Restart")) {
                        self.questionCount = 0
                        self.score = 0
                        self.nextQuestion()
                    }
                )
            }
        }
    }

    func didTapButton(at index: Int) {
        let count = moves.count
        let shift = shouldWin ? (count - 1) : 1
        let result = (index + shift) % count == appChoice

        score += result ? 1 : -1

        questionCount += 1
        if questionCount == maxQuestions {
            isShowingAlert = true
        } else {
            nextQuestion()
        }
    }

    func nextQuestion() {
        shouldWin = Bool.random()
        appChoice = Int.random(in: 0 ..< 3)
    }

}

struct CaptionView: View {

    private var title: String
    private var text: String

    init(title: String, text: String) {
        self.title = title
        self.text = text
    }

    var body: some View {
        VStack {
            Text(title)
                .font(.headline)
            Text(text)
                .font(.largeTitle)
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

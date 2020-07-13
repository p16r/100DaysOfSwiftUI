//
//  QuestionsView.swift
//  Multiplay
//
//  Created by Prathamesh Kowarkar on 12/07/20.
//

import SwiftUI

struct QuestionsView: View {

    private let multiplicand: Int
    private let numberOfQuestions: Int

    @State private var answer = ""
    @State private var score = 0
    @State private var index = 0
    @State private var questions: [Question]

    init(
        multiplicand: Int,
        numberOfQuestions: Int
    ) {
        self.multiplicand = multiplicand
        self.numberOfQuestions = numberOfQuestions
        self._questions = State(
            initialValue: (1...numberOfQuestions).shuffled().map {
                Question(multiplicand: multiplicand, multiplier: $0)
            }
        )
    }

    var body: some View {
        Group {
            if questions.indices.contains(index) {
                questionView(question: questions[index])
            } else {
                gameOverView
            }
        }
    }

    private func questionView(question: Question) -> some View {
        VStack {
            QuestionView(question: question) {
                score += 1
                index += 1
            } wrongAnswerAction: {
                index += 1
            }
            Text("Your score is: \(score)")
        }
    }

    private var gameOverView: some View {
        GameOverView(
            score: score,
            restartAction: {
                score = 0
                questions.shuffle()
                index = questions.startIndex
            }
        )
    }

}

struct QuestionsView_Previews: PreviewProvider {

    static var previews: some View {
        QuestionsView(multiplicand: 2, numberOfQuestions: 5)
    }

}

//
//  QuestionView.swift
//  Multiplay
//
//  Created by Prathamesh Kowarkar on 12/07/20.
//

import SwiftUI

struct QuestionView: View {

    private let question: Question
    private let correctAnswerAction: (() -> Void)?
    private let wrongAnswerAction: (() -> Void)?

    @State private var answer = ""

    init(
        question: Question,
        correctAnswerAction: (() -> Void)?,
        wrongAnswerAction: (() -> Void)? = nil
    ) {
        self.question = question
        self.correctAnswerAction = correctAnswerAction
        self.wrongAnswerAction = wrongAnswerAction
    }

    var body: some View {
        VStack {
            VStack(spacing: 16) {
                Text(question.statement)
                TextField("Answer", text: $answer) {
                    if Int(answer) == question.answer {
                        correctAnswerAction?()
                    } else {
                        wrongAnswerAction?()
                    }
                    answer = ""
                }
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
                .padding()
                .background(Color.yellow)
                .cornerRadius(16)
                .padding()
        }
    }

}

struct QuestionView_Previews: PreviewProvider {

    static var previews: some View {
        QuestionView(
            question: Question(multiplicand: 2, multiplier: 3),
            correctAnswerAction: {}
        )
    }
    
}

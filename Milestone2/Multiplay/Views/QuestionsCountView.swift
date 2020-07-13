//
//  QuestionsCountView.swift
//  Multiplay
//
//  Created by Prathamesh Kowarkar on 12/07/20.
//

import SwiftUI

struct QuestionsCountView: View {

    @Binding private var questionsCount: Int
    private let questionsCountArray = [5, 10, 20]

    init(questionsCount: Binding<Int>) {
        self._questionsCount = questionsCount
    }

    var body: some View {
        VStack(spacing: 16) {
            Text("How many questions?")
                .multilineTextAlignment(.center)
            HStack(spacing: 16) {
                ForEach(questionsCountArray, id: \.self) { number in
                    Button(String(describing: number)) {
                        questionsCount = number
                    }
                    .accentColor(.primary)
                    .rounded(
                        backgroundColor: number == questionsCount
                            ? .blue
                            : Color.blue.opacity(0.5)
                    )
                    .scaleEffect(questionsCount == number ? 1.2 : 1)
                    .animation(
                        .interpolatingSpring(stiffness: 1000, damping: 20)
                    )
                }
            }
        }
    }

}

struct QuestionsCountView_Previews: PreviewProvider {

    static var previews: some View {
        QuestionsCountView(questionsCount: Binding { 0 } set: { _ in } )
    }

}

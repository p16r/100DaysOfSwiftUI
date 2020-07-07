//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Prathamesh Kowarkar on 08/04/20.
//  Copyright © 2020 Prathamesh Kowarkar. All rights reserved.
//

import SwiftUI

struct FlagImageView: View {

    let country: String

    var body: some View {
        Image(country)
            .renderingMode(.original)
            .clipShape(Capsule())
            .overlay(
                Capsule()
                    .stroke(Color.black, lineWidth: 1)
            )
            .shadow(color: .black, radius: 2)
    }

}

struct ContentView: View {

    @State private var countries = [
        "Estonia",
        "France",
        "Germany",
        "Ireland",
        "Italy",
        "Nigeria",
        "Poland",
        "Russia",
        "Spain",
        "UK",
        "US"
    ]
        .shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var selectedAnswer = 0
    @State private var answerIsCorrect = false

    @State private var isShowingAlert = false
    @State private var score = 0

    @State private var rotationDegrees = 0.0

    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [.blue, .black]),
                startPoint: .top,
                endPoint: .bottom
            )
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 16) {
                VStack {
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                ForEach(0..<3) { number in
                    Button {
                        withAnimation {
                            rotationDegrees = 360
                            flagTapped(number)
                        }
                    } label: { FlagImageView(country: self.countries[number]) }
                    .rotation3DEffect(
                        .degrees(number == correctAnswer ? rotationDegrees : 0),
                        axis: (x: 0, y: 1, z: 0)
                    )
                }
                Text("Score: \(score)")
                    .foregroundColor(.white)
                Spacer()
            }
        }
        .alert(isPresented: $isShowingAlert) {
            Alert(
                title: Text(answerIsCorrect ? "Correct" : "Wrong"),
                message: Text(
                    answerIsCorrect
                        ? "Your score is \(score)."
                        : "You chose the flag of \(countries[selectedAnswer])."
                ),
                dismissButton: .default(Text("Continue")) {
                    withAnimation {
                        rotationDegrees = 0
                        askQuestion()
                    }
                }
            )
        }
    }

    func flagTapped(_ number: Int) {
        selectedAnswer = number
        answerIsCorrect = number == correctAnswer
        score = answerIsCorrect ? score + 1 : 0
        isShowingAlert = true
    }

    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0..<3)
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

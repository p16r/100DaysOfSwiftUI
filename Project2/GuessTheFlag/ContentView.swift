//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Prathamesh Kowarkar on 08/04/20.
//  Copyright © 2020 Prathamesh Kowarkar. All rights reserved.
//

import SwiftUI

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

    @State private var isShowingAlert = false
    @State private var scoreTitle = ""

    var body: some View {
        ZStack {
            Color.blue.edgesIgnoringSafeArea(.all)
            VStack(spacing: 16) {
                VStack {
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                }
                ForEach(0..<3) { number in
                    Button(
                        action: {
                            self.flagTapped(number)
                        }
                    ) {
                        Image(self.countries[number])
                            .renderingMode(.original)
                    }
                }
                Spacer()
            }
        }
        .alert(isPresented: $isShowingAlert) { () -> Alert in
            Alert(
                title: Text(scoreTitle),
                message: Text("Your score is…"),
                dismissButton: .default(Text("Continue")) {
                    self.askQuestion()
                }
            )
        }
    }

    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
        } else {
            scoreTitle = "Wrong"
        }
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

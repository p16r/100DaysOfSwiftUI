//
//  ContentView.swift
//  WordScramble
//
//  Created by Prathamesh Kowarkar on 27/06/20.
//

import SwiftUI

struct ContentView: View {

    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""

    var body: some View {
        NavigationView {
            VStack {
                TextField(
                    "Enter your word",
                    text: $newWord,
                    onCommit: addNewWord
                )
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .padding()
                List(usedWords, id: \.self) {
                    Image(systemName: "\($0.count).circle")
                    Text($0)
                }
                .listStyle(PlainListStyle())
            }
            .navigationBarTitle(rootWord)
            .onAppear(perform: startGame)
        }
    }

    func addNewWord() {
        let answer = newWord
            .lowercased()
            .trimmingCharacters(in: .whitespacesAndNewlines)

        if answer.isEmpty { return }

        usedWords.insert(answer, at: 0)
        newWord = ""
    }

    func startGame() {
        guard let word = Bundle.main.url(
                forResource: "start",
                withExtension: "txt"
            )
            .flatMap({ try? String(contentsOf: $0) })
            .flatMap({ $0.components(separatedBy: "\n").randomElement() })
        else {
            fatalError("Could not load start.txt from Bundle.")
        }
        rootWord = word
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

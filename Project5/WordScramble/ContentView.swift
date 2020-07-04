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

    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false

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
            .navigationBarItems(leading: Button("Reset", action: startGame))
            .navigationBarTitle(rootWord)
            .onAppear(perform: startGame)
            .alert(isPresented: $showingError) {
                Alert(
                    title: Text(errorTitle),
                    message: Text(errorMessage),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
    }

    func addNewWord() {
        let answer = newWord
            .lowercased()
            .trimmingCharacters(in: .whitespacesAndNewlines)

        if answer.isEmpty { return }

        guard isNotRootWord(word: answer) else {
            wordError(
                title: "Use A Different Word",
                message: "Can't use original word."
            )
            return
        }

        guard isLongEnough(word: answer) else {
            wordError(
                title: "Word Too Short",
                message: "Use a longer word."
            )
            return
        }

        guard isOriginal(word: answer) else {
            wordError(
                title: "Word Used Already",
                message: "Be more original."
            )
            return
        }

        guard isPossible(word: answer) else {
            wordError(
                title: "Word Not Recognized",
                message: "You can't just make them up, you know!"
            )
            return
        }

        guard isReal(word: answer) else {
            wordError(
                title: "Word Not Real",
                message: "That isn't a real word."
            )
            return
        }

        usedWords.insert(answer, at: 0)
        newWord = ""
    }

    func isLongEnough(word: String) -> Bool {
        word.count >= 3
    }

    func isNotRootWord(word: String) -> Bool {
        word != rootWord
    }

    func isOriginal(word: String) -> Bool {
        !usedWords.contains(word)
    }

    func isPossible(word: String) -> Bool {
        word.allSatisfy(rootWord.contains)
    }

    func isReal(word: String) -> Bool {
        UITextChecker().rangeOfMisspelledWord(
            in: word,
            range: NSRange(location: 0, length: word.utf16.count),
            startingAt: 0,
            wrap: false,
            language: "en"
        )
        .location == NSNotFound
    }

    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
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
        usedWords = []
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

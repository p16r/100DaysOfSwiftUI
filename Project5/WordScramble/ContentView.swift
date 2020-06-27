//
//  ContentView.swift
//  WordScramble
//
//  Created by Prathamesh Kowarkar on 27/06/20.
//

import SwiftUI

struct ContentView: View {

    let people = ["Finn", "Leia", "Luke", "Rey"]

    var body: some View {
        let word = "SWift"
        let misspelledRange = UITextChecker().rangeOfMisspelledWord(
            in: word,
            range: NSRange(location: 0, length: word.utf16.count),
            startingAt: 0,
            wrap: false,
            language: "en"
        )
        let noMisspellingsFound = misspelledRange.location == NSNotFound
        print(noMisspellingsFound)
        return List(people, id: \.self) {
            Text($0)
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

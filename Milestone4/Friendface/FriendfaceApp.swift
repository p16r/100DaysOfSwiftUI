//
//  FriendfaceApp.swift
//  Friendface
//
//  Created by Prathamesh Kowarkar on 28/09/20.
//

import SwiftUI

@main
struct FriendfaceApp: App {

    private let container = FriendfaceContainer()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, container.viewContext)
        }
    }
}

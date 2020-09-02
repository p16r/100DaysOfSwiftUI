//
//  Habit.swift
//  HabitsWithSwift
//
//  Created by Prathamesh Kowarkar on 31/08/20.
//

import Foundation

struct Habit: Identifiable, Codable {

    let id: UUID
    let title: String
    let description: String
    var timesCompleted: Int

    init(_ title: String, _ description: String) {
        self.id = UUID()
        self.title = title
        self.description = description
        self.timesCompleted = 0
    }

    static var example: Habit {
        Self("title", "description")
    }

}

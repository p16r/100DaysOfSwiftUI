//
//  HabitListItem.swift
//  HabitsWithSwift
//
//  Created by Prathamesh Kowarkar on 31/08/20.
//

import SwiftUI

struct HabitListItem: View {

    let habit: Habit

    var body: some View {
        VStack(alignment: .leading) {
            Text(habit.title)
                .font(.headline)
            Text("Completed: \(habit.timesCompleted)")
                .foregroundColor(.secondary)
        }
    }

}

struct HabitListItem_Previews: PreviewProvider {

    static var previews: some View {
        List {
            HabitListItem(habit: .example)
        }
    }

}

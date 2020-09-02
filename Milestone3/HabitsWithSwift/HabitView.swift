//
//  HabitView.swift
//  HabitsWithSwift
//
//  Created by Prathamesh Kowarkar on 31/08/20.
//

import SwiftUI

struct HabitView: View {

    @Binding var habit: Habit

    var body: some View {
        List {
            Section(header: Text("Title")) {
                Text(habit.title)
            }
            Section(header: Text("Description")) {
                Text(habit.description)
            }
            Section(header: Text("Completed Times")) {
                Button("\(habit.timesCompleted)") {
                    habit.timesCompleted += 1
                }
            }
        }
        .listStyle(GroupedListStyle())
        .navigationTitle("Habit")
    }

}

struct HabitView_Previews: PreviewProvider {

    @State static var habit: Habit = Habit.example

    static var previews: some View {
        NavigationView {
            NavigationLink(destination: HabitView(habit: $habit)) {
                HabitListItem(habit: habit)
            }
            .navigationTitle("Habits")
        }
    }

}

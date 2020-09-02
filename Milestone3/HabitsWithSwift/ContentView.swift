//
//  ContentView.swift
//  HabitsWithSwift
//
//  Created by Prathamesh Kowarkar on 31/08/20.
//

import SwiftUI

struct ContentView: View {

    @State private var habits = UserDefaults.standard.data(forKey: "habits")
        .flatMap { try? JSONDecoder().decode([Habit].self, from: $0) }
        ?? []
    {
        didSet {
            (try? JSONEncoder().encode(habits)).map {
                UserDefaults.standard.set($0, forKey: "habits")
            }
        }
    }
    @State private var isSheetPresented = false

    var body: some View {
        NavigationView {
            List {
                ForEach(0..<habits.count, id: \.self) { index in
                    NavigationLink(destination: habitView(for: index)) {
                         HabitListItem(habit: habits[index])
                    }
                }
                .onDelete {
                    habits.remove(atOffsets: $0)
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Habits")
            .navigationBarItems(
                trailing: Button(
                    action: { isSheetPresented.toggle() },
                    label: { Image(systemName: "plus") }
                )
            )
        }
        .sheet(isPresented: $isSheetPresented) {
            NewHabitView {
                habits.append($0)
            }
        }
    }

    private func habitView(for index: Int) -> some View {
        let habit = Binding(
            get: { habits[index] },
            set: { habits[index] = $0 }
        )
        return HabitView(habit: habit)
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

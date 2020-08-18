//
//  ContentView.swift
//  Moonshot
//
//  Created by Prathamesh Kowarkar on 10/08/20.
//

import SwiftUI

struct ContentView: View {

    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    @State var keyPath = \Mission.formattedLaunchDate

    var body: some View {
        NavigationView {
            List(missions) { mission in
                NavigationLink(destination: MissionView(mission: mission)) {
                    Image(mission.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 44, height: 44)
                    VStack(alignment: .leading) {
                        Text(mission.displayName)
                            .font(.headline)
                        Text(mission[keyPath: keyPath])
                    }
                }
            }
            .navigationBarItems(
                trailing: Button(
                    keyPath == \.astronautNames ? "Launch Date" : "Crew"
                ) {
                    switch keyPath {
                        case \.formattedLaunchDate: keyPath = \.astronautNames
                        case \.astronautNames: keyPath = \.formattedLaunchDate
                        default: break
                    }
                }
            )
            .navigationTitle(Text("Moonshot"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

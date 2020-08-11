//
//  ContentView.swift
//  Moonshot
//
//  Created by Prathamesh Kowarkar on 10/08/20.
//

import SwiftUI

struct ContentView: View {

    let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")

    var body: some View {
        NavigationView {
            List(missions) { mission in
                NavigationLink(destination: Text("DetailView")) {
                    Image(mission.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 44, height: 44)
                    VStack(alignment: .leading) {
                        Text(mission.displayName)
                            .font(.headline)
                        Text(mission.formattedLaunchDate)
                    }
                }
            }
            .navigationTitle(Text("Moonshot"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

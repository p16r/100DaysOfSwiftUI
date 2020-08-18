//
//  AstronautView.swift
//  Moonshot
//
//  Created by Prathamesh Kowarkar on 17/08/20.
//

import SwiftUI

struct AstronautView: View {

    let astronaut: Astronaut
    let missions: [Mission]

    private static let allMissions: [Mission] = Bundle.main
        .decode("missions.json")

    init(_ astronaut: Astronaut) {
        self.astronaut = astronaut
        self.missions = Self.allMissions.filter { mission in
            mission.crew.map(\.name).contains(astronaut.id)
        }
    }

    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack {
                    Image(astronaut.id)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width)
                    Text(astronaut.description)
                        .padding()
                    ForEach(missions) { mission in
                        HStack {
                            Image(mission.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 44, height: 44)
                            VStack(alignment: .leading) {
                                Text(mission.displayName)
                                    .font(.headline)
                                Text(mission.formattedLaunchDate)
                            }
                            Spacer()
                        }
                        .padding([.horizontal, .bottom])
                    }
                }
            }
        }
        .navigationBarTitle(Text(astronaut.name), displayMode: .inline)
    }
}

struct AstronautView_Previews: PreviewProvider {

    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")

    static var previews: some View {
        AstronautView(astronauts[0])
    }
    
}

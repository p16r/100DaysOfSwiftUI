//
//  MissionView.swift
//  Moonshot
//
//  Created by Prathamesh Kowarkar on 17/08/20.
//

import SwiftUI

struct MissionView: View {

    struct CrewMember {

        let role: String
        let astronaut: Astronaut

    }

    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")

    let mission: Mission
    let astronauts: [CrewMember]

    init(mission: Mission) {
        self.mission = mission
        self.astronauts = mission.crew.compactMap { member in
            Self.astronauts
                .first(where: { $0.id == member.name })
                .map { CrewMember(role: member.role, astronaut: $0) }
        }
    }

    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack {
                    Image(mission.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometry.size.width * 0.75)
                        .padding(.top)
                    Text(mission.description)
                        .padding()
                    ForEach(astronauts, id: \.role) { crewMember in
                        NavigationLink(
                            destination: AstronautView(crewMember.astronaut)
                        ) {
                            HStack {
                                Image(crewMember.astronaut.id)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: geometry.size.width * 0.25)
                                    .clipShape(Capsule())
                                    .overlay(
                                        Capsule()
                                            .stroke(Color.accentColor, lineWidth: 2)
                                    )
                                VStack(alignment: .leading) {
                                    Text(crewMember.astronaut.name)
                                        .font(.headline)
                                    Text(crewMember.role)
                                        .foregroundColor(.secondary)
                                }
                                Spacer()
                            }
                            .padding(.horizontal)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                    Spacer(minLength: 25)
                }
            }
        }
        .navigationBarTitle(Text(mission.displayName))
    }
}

struct MissionView_Previews: PreviewProvider {

    static let missions: [Mission] = Bundle.main.decode("missions.json")

    static var previews: some View {
        MissionView(mission: missions[0])
    }

}

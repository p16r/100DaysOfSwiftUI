//
//  MissionView.swift
//  Moonshot
//
//  Created by Prathamesh Kowarkar on 17/08/20.
//

import SwiftUI

struct MissionView: View {

    let mission: Mission

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

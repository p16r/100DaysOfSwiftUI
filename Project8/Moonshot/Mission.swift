//
//  Mission.swift
//  Moonshot
//
//  Created by Prathamesh Kowarkar on 11/08/20.
//

import Foundation

struct Mission: Codable, Identifiable {

    struct CrewRole: Codable {

        let name: String
        let role: String

    }

    let id: Int
    let launchDate: String?
    let crew: [CrewRole]
    let description: String

}

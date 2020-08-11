//
//  Bundle+.swift
//  Moonshot
//
//  Created by Prathamesh Kowarkar on 11/08/20.
//

import Foundation

extension Bundle {

    func decode<T: Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        guard let astronauts = try? JSONDecoder().decode(T.self, from: data)
        else {
            fatalError("Failed to decode \(file) from bundle.")
        }
        return astronauts
    }

}

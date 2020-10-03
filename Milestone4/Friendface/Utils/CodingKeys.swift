//
//  CodingKeys.swift
//  Friendface
//
//  Created by Prathamesh Kowarkar on 04/10/20.
//

import Foundation

struct CodingKeys: CodingKey, ExpressibleByStringLiteral {

    var stringValue: String
    var intValue: Int?

    init(stringValue: String) {
        self.stringValue = stringValue
        self.intValue = Int(stringValue)
    }

    init(intValue: Int) {
        self.stringValue = String(intValue)
        self.intValue = intValue
    }

    init(stringLiteral value: String) {
        self.init(stringValue: value)
    }

}

//
//  CupcakeOrder.swift
//  Cupcake Corner
//
//  Created by Prathamesh Kowarkar on 17/09/20.
//

import Foundation

struct CupcakeOrder: Codable {

    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]

    var type = 0
    var quantity = 3

    var specialRequestsEnabled = false{
        didSet {
            if specialRequestsEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    var extraFrosting = false
    var addSprinkles = false

    var name = ""
    var streetAddress = ""
    var city = ""
    var zip = ""

    var hasValidAddress: Bool {
        !(
            name.trimmingCharacters(in: .whitespaces).isEmpty ||
                streetAddress.trimmingCharacters(in: .whitespaces).isEmpty ||
                city.trimmingCharacters(in: .whitespaces).isEmpty ||
                zip.trimmingCharacters(in: .whitespaces).isEmpty
        )
    }

    var cost: Double {
        var cost = Double(quantity) * 2
        cost = Double(type) / 2
        if extraFrosting { cost += Double(quantity) }
        if addSprinkles { cost += Double(quantity) / 2 }
        return cost
    }

}


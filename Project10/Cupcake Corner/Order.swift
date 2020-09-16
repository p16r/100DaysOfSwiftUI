//
//  Order.swift
//  Cupcake Corner
//
//  Created by Prathamesh Kowarkar on 15/09/20.
//

import Foundation

class Order: ObservableObject {

    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]

    @Published var type = 0
    @Published var quantity = 3

    @Published var specialRequestsEnabled = false{
        didSet {
            if specialRequestsEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    @Published var extraFrosting = false
    @Published var addSprinkles = false

    @Published var name = ""
    @Published var streetAddress = ""
    @Published var city = ""
    @Published var zip = ""

    var hasValidAddress: Bool {
        !(name.isEmpty || streetAddress.isEmpty || city.isEmpty || zip.isEmpty)
    }

    var cost: Double {
        var cost = Double(quantity) * 2
        cost = Double(type) / 2
        if extraFrosting { cost += Double(quantity) }
        if addSprinkles { cost += Double(quantity) / 2 }
        return cost
    }

}

//
//  Order.swift
//  Cupcake Corner
//
//  Created by Prathamesh Kowarkar on 15/09/20.
//

import Foundation

class Order: ObservableObject, Codable {

    @Published var cupcakeOrder: CupcakeOrder

    required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        self.cupcakeOrder = try container.decode(CupcakeOrder.self)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(cupcakeOrder)
    }

    init() {
        self.cupcakeOrder = CupcakeOrder()
    }

}

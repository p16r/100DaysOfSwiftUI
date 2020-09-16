//
//  CheckoutView.swift
//  Cupcake Corner
//
//  Created by Prathamesh Kowarkar on 16/09/20.
//

import SwiftUI

struct CheckoutView: View {

    @ObservedObject var order: Order

    var body: some View {
        Text("Hello, World!")
    }

}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(order: Order())
    }
}

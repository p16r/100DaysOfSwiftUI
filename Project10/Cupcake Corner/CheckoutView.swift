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
        GeometryReader { proxy in
            ScrollView {
                VStack {
                    Image("cupcakes")
                        .resizable()
                        .scaledToFit()
                        .frame(width: proxy.size.width)
                    Text("Your total is: $\(order.cost, specifier: "%.2f")")
                        .font(.title)
                    Button("Place Order") {

                    }
                    .padding()
                }
            }
        }
        .navigationBarTitle("Checkout", displayMode: .inline)
    }

}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(order: Order())
    }
}

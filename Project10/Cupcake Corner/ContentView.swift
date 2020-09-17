//
//  ContentView.swift
//  Cupcake Corner
//
//  Created by Prathamesh Kowarkar on 14/09/20.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject var order = Order()

    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your cake type", selection: $order.cupcakeOrder.type) {
                        ForEach(0..<CupcakeOrder.types.count, id: \.self) {
                            Text(CupcakeOrder.types[$0])
                        }
                    }
                    Stepper(value: $order.cupcakeOrder.quantity, in: 3...20) {
                        Text("Number of cakes: \(order.cupcakeOrder.quantity)")
                    }
                }
                Section {
                    Toggle(isOn: $order.cupcakeOrder.specialRequestsEnabled.animation()) {
                        Text("Any special requests?")
                    }

                    if order.cupcakeOrder.specialRequestsEnabled {
                        Toggle(isOn: $order.cupcakeOrder.extraFrosting) {
                            Text("Add extra frosting")
                        }

                        Toggle(isOn: $order.cupcakeOrder.addSprinkles) {
                            Text("Add extra sprinkles")
                        }
                    }
                }
                Section {
                    NavigationLink(destination: AddressView(order: order)) {
                        Text("Delivery details")
                    }
                }
            }
            .navigationBarTitle("Cupcake Corner")
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

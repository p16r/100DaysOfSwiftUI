//
//  CheckoutView.swift
//  Cupcake Corner
//
//  Created by Prathamesh Kowarkar on 16/09/20.
//

import SwiftUI

struct CheckoutView: View {

    @ObservedObject var order: Order
    @State private var alertMessage = ""
    @State private var alertTitle = ""
    @State private var showingConfirmation = false

    var body: some View {
        GeometryReader { proxy in
            ScrollView {
                VStack {
                    Image("cupcakes")
                        .resizable()
                        .scaledToFit()
                        .frame(width: proxy.size.width)
                    Text("Your total is: $\(order.cupcakeOrder.cost, specifier: "%.2f")")
                        .font(.title)
                    Button("Place Order", action: placeOrder)
                        .padding()
                }
            }
        }
        .navigationBarTitle("Checkout", displayMode: .inline)
        .alert(isPresented: $showingConfirmation) {
            Alert(
                title: Text(alertTitle),
                message: Text(alertMessage),
                dismissButton: .default(Text("OK"))
            )
        }
    }

    func placeOrder() {
        guard let body = try? JSONEncoder().encode(order) else {
            return print("Failed to encode order.")
        }
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = body
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                alertTitle = "Error"
                alertMessage = error.localizedDescription
                showingConfirmation = true
                return
            }
            guard let data = data else {
                alertTitle = "Error"
                alertMessage = "No data in response"
                showingConfirmation = true
                return
            }
            if let order = try? JSONDecoder().decode(Order.self, from: data) {
                alertTitle = "Thank You!"
                alertMessage = """
                Your order for \(order.cupcakeOrder.quantity)x \
                \(CupcakeOrder.types[order.cupcakeOrder.type].lowercased()) cupcakes is on its way!
                """
                showingConfirmation = true
            } else {
                alertTitle = "Error"
                alertMessage = "Invalid response from server"
                showingConfirmation = true
            }
        }
        .resume()
    }

}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(order: Order())
    }
}

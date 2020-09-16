//
//  CheckoutView.swift
//  Cupcake Corner
//
//  Created by Prathamesh Kowarkar on 16/09/20.
//

import SwiftUI

struct CheckoutView: View {

    @ObservedObject var order: Order
    @State private var confirmationMessage = ""
    @State private var showingConfirmation = false

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
                    Button("Place Order", action: placeOrder)
                        .padding()
                }
            }
        }
        .navigationBarTitle("Checkout", displayMode: .inline)
        .alert(isPresented: $showingConfirmation) {
            Alert(
                title: Text("Thank You!"),
                message: Text(confirmationMessage),
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
                return print("Error: \(error.localizedDescription)")
            }
            guard let data = data else {
                return print("No data in response")
            }
            if let order = try? JSONDecoder().decode(Order.self, from: data) {
                self.confirmationMessage = """
                Your order for \(order.quantity)x \
                \(Order.types[order.type].lowercased()) cupcakes is on its way!
                """
                self.showingConfirmation = true
            } else {
                print("Invalid response from server")
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

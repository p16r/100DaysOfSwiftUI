//
//  AddressView.swift
//  Cupcake Corner
//
//  Created by Prathamesh Kowarkar on 15/09/20.
//

import SwiftUI

struct AddressView: View {

    @ObservedObject var order: Order

    var body: some View {
        Text("Hello World")
    }
    
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(order: Order())
    }
}

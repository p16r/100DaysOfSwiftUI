//
//  View+.swift
//  Friendface
//
//  Created by Prathamesh Kowarkar on 04/10/20.
//

import SwiftUI

extension View {

    /// Presents an alert to the user when the binding passed to this modifier
    /// is set to a non-nil value.
    ///
    /// - Parameters:
    ///   - binding: The binding to the optional value.
    ///   - content: A closure returning the alert to present.
    @ViewBuilder
    func alert<Value>(
        boundTo binding: Binding<Value?>,
        content: (Value) -> Alert
    ) -> some View {
        if let value = binding.wrappedValue {
            let get: (Value?) -> Bool = { $0 != nil }
            let set: (Bool, inout Value?) -> Void = { if !$0 { $1 = nil } }
            let boolBinding = binding.map(get: get, set: set)
            alert(isPresented: boolBinding) { content(value) }
        } else { self }
    }

}

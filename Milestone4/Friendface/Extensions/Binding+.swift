//
//  Binding+.swift
//  Friendface
//
//  Created by Prathamesh Kowarkar on 04/10/20.
//

import SwiftUI

extension Binding {

    func map<NewValue>(
        get: @escaping (Value) -> NewValue,
        set: @escaping (NewValue, inout Value) -> Void
    ) -> Binding<NewValue> {
        Binding<NewValue>(
            get: { get(wrappedValue) },
            set: { set($0, &wrappedValue) }
        )
    }

    func map<NewValue>(
        get: @escaping (Value) -> NewValue,
        set: @escaping (NewValue) -> Value
    ) -> Binding<NewValue> {
        Binding<NewValue>(
            get: { get(wrappedValue) },
            set: { wrappedValue = set($0) }
        )
    }

    func map<NewValue>(
        get: @escaping (Value) -> NewValue
    ) -> Binding<NewValue> {
        return Binding<NewValue>(
            get: { get(wrappedValue) },
            set: { _ in }
        )
    }

}

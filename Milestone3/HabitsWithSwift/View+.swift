//
//  View+.swift
//  HabitsWithSwift
//
//  Created by Prathamesh Kowarkar on 02/09/20.
//

import SwiftUI

extension View {

    @ViewBuilder
    func alert<T>(
        boundTo binding: Binding<T?>,
        content: (T) -> Alert
    ) -> some View {
        switch binding.wrappedValue {
            case .some(let value): alert(
                isPresented: Binding(
                    get: { binding.wrappedValue != nil },
                    set: { newValue in
                        if newValue == false {
                            binding.wrappedValue = nil
                        }
                    }
                ),
                content: { content(value) }
            )
            case .none: self
        }
    }

}

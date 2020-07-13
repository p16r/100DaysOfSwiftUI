//
//  View+.swift
//  Multiplay
//
//  Created by Prathamesh Kowarkar on 12/07/20.
//

import SwiftUI

extension View {

    func rounded(size: CGFloat = 64, backgroundColor: Color) -> some View {
        modifier(Rounded(size: size, backgroundColor: backgroundColor))
    }

    func disabled(
        withOpacity opacity: Double = 0.8,
        if condition: @autoclosure () -> Bool
    ) -> some View {
        let condition = condition()
        return disabled(condition)
            .opacity(condition ? opacity : 1)
    }

}

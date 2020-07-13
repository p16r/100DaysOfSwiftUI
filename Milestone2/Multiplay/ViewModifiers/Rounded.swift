//
//  Rounded.swift
//  Multiplay
//
//  Created by Prathamesh Kowarkar on 12/07/20.
//

import SwiftUI

struct Rounded: ViewModifier {

    let size: CGFloat
    let backgroundColor: Color

    func body(content: Content) -> some View {
        content
            .frame(minWidth: size, minHeight: size)
            .background(backgroundColor)
            .clipShape(Circle())
    }

}

struct Rounded_Previews: PreviewProvider {
    static var previews: some View {
        Text("UI!")
            .rounded(size: 80, backgroundColor: .accentColor)
    }
}

//
//  MultiplicandSelectionView.swift
//  Multiplay
//
//  Created by Prathamesh Kowarkar on 12/07/20.
//

import SwiftUI

struct MultiplicandSelectionView: View {

    @Binding private var multiplicand: Int

    init(multiplicand: Binding<Int>) {
        self._multiplicand = multiplicand
    }

    var body: some View {
        VStack(spacing: 16) {
            Text("Select times table")
                .multilineTextAlignment(.center)
            HStack(spacing: 32) {
                Button("↑") { multiplicand += 1 }
                    .rounded(backgroundColor: .green)
                    .disabled(if: multiplicand >= 20)
                Text("\(multiplicand)")
                    .rounded(size: 96, backgroundColor: .yellow)
                    .rotation3DEffect(
                        .degrees(Double(multiplicand) * -360),
                        axis: (x: 1, y: 0, z: 0)
                    )
                    .animation(
                        .interpolatingSpring(stiffness: 1000, damping: 10)
                    )
                Button("↓") { multiplicand -= 1 }
                    .rounded(backgroundColor: .red)
                    .disabled(if: multiplicand <= 1)
            }
                .accentColor(.primary)
        }
    }

}

struct MultiplicandSelectionView_Previews: PreviewProvider {

    static var previews: some View {
        MultiplicandSelectionView(multiplicand: Binding { 2 } set: { _ in })
            .previewLayout(.sizeThatFits)
    }

}

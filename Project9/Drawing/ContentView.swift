//
//  ContentView.swift
//  Drawing
//
//  Created by Prathamesh Kowarkar on 25/08/20.
//

import SwiftUI

struct ContentView: View {

    @State private var thicknessFraction: CGFloat = 0.5

    var body: some View {
        Arrow(thicknessFraction: thicknessFraction)
            .frame(width: 300, height: 300)
            .onTapGesture {
                withAnimation {
                    thicknessFraction = CGFloat.random(in: 0.1...0.9)
                }
            }
    }

}

struct Arrow: Shape {

    var arrowFraction: CGFloat
    var thicknessFraction: CGFloat

    var animatableData: CGFloat {
        get { thicknessFraction }
        set { thicknessFraction = newValue }
    }

    init(arrowFraction: CGFloat = 0.5, thicknessFraction: CGFloat = 0.5) {
        self.arrowFraction = max(0, min(arrowFraction, 1))
        self.thicknessFraction = 1 - max(0, min(thicknessFraction, 1))
    }

    func path(in rect: CGRect) -> Path {
        let arrowTip = CGPoint(x: rect.midX, y: rect.minY)
        let arrowBaseY = rect.height * arrowFraction
        let lineIndent = (rect.maxX - rect.minX) / 2 * thicknessFraction
        let lineLeadingX = rect.minX + lineIndent
        let lineTrailingX = rect.maxX - lineIndent
        return Path { path in
            path.move(to: arrowTip)
            [
                CGPoint(x: rect.minX, y: arrowBaseY),
                CGPoint(x: lineLeadingX, y: arrowBaseY),
                CGPoint(x: lineLeadingX, y: rect.maxY),
                CGPoint(x: lineTrailingX, y: rect.maxY),
                CGPoint(x: lineTrailingX, y: arrowBaseY),
                CGPoint(x: rect.maxX, y: arrowBaseY),
                arrowTip,
            ]
            .forEach { point in
                path.addLine(to: point)
            }
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

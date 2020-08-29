//
//  ContentView.swift
//  Drawing
//
//  Created by Prathamesh Kowarkar on 25/08/20.
//

import SwiftUI

struct ContentView: View {

    @State private var colorCycle = 0.0

    var body: some View {
        VStack {
            ColorCyclingRectangle(amount: colorCycle)
            Slider(value: $colorCycle)
                .padding()
        }
    }

}

struct ColorCyclingRectangle: View {

    var amount = 0.0
    var steps = 100

    var body: some View {
        ZStack {
            ForEach(0..<steps) { value in
                Rectangle()
                    .inset(by: CGFloat(value))
                    .strokeBorder(
                        LinearGradient(
                            gradient: Gradient(
                                colors: [
                                    self.color(for: value, brightness: 1),
                                    self.color(for: value, brightness: 0.5)
                                ]
                            ),
                            startPoint: .top,
                            endPoint: .bottom
                        ),
                        lineWidth: 2
                    )
            }
        }
        .drawingGroup()
    }

    func color(for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(steps) + amount
        if targetHue > 1 {
            targetHue -= 1
        }
        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }

}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  Drawing
//
//  Created by Prathamesh Kowarkar on 25/08/20.
//

import SwiftUI

struct ContentView: View {

    @State private var innerRadius = 125.0
    @State private var outerRadius = 75.0
    @State private var distance = 25.0
    @State private var amount: CGFloat = 1.0
    @State private var hue = 0.6

    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            Spirograph(
                innerRadius: Int(innerRadius),
                outerRadius: Int(outerRadius),
                distance: Int(distance),
                amount: amount
            )
            .stroke(Color(hue: hue, saturation: 1, brightness: 1), lineWidth: 1)
            .frame(width: 300, height: 300)
            Group {
                Text("Inner radius: \(Int(innerRadius))")
                Slider(value: $innerRadius, in: 10...150, step: 1)
                    .padding([.horizontal, .bottom])
                
                Text("Outer radius: \(Int(outerRadius))")
                Slider(value: $outerRadius, in: 10...150, step: 1)
                    .padding([.horizontal, .bottom])

                Text("Distance: \(Int(distance))")
                Slider(value: $distance, in: 1...150, step: 1)
                    .padding([.horizontal, .bottom])

                Text("Amount: \(amount, specifier: "%.2f")")
                Slider(value: $amount)
                    .padding([.horizontal, .bottom])

                Text("Color")
                Slider(value: $hue)
                    .padding([.horizontal, .bottom])
            }
        }
    }

}

struct Spirograph: Shape {

    let innerRadius: Int
    let outerRadius: Int
    let distance: Int
    let amount: CGFloat

    func path(in rect: CGRect) -> Path {
        let divisor = CGFloat(gcd(innerRadius, outerRadius))
        let outerRadius = CGFloat(self.outerRadius)
        let innerRadius = CGFloat(self.innerRadius)
        let distance = CGFloat(self.distance)
        let difference = innerRadius - outerRadius
        let endPoint = ceil(2 * CGFloat.pi * outerRadius / divisor) * amount

        let startPoint = CGPoint(
            x: difference + distance + rect.width / 2,
            y: rect.height / 2
        )

        return stride(from: 0, through: endPoint, by: 0.01)
            .map { theta in
                let theta2 = difference / outerRadius * theta
                return CGPoint(
                    x: difference * cos(theta) +
                        distance * cos(theta2) +
                        rect.width / 2,
                    y: difference * sin(theta) -
                        distance * sin(theta2) +
                        rect.height / 2
                )
            }
            .reduce(into: Path { $0.move(to: startPoint) }) { path, point in
                path.addLine(to: point)
            }
    }

    func gcd(_ a: Int, _ b: Int) -> Int {

        var a = a
        var b = b

        while b != 0 {
            let temp = b
            b = a % b
            a = temp
        }

        return a
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

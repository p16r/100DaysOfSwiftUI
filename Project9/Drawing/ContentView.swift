//
//  ContentView.swift
//  Drawing
//
//  Created by Prathamesh Kowarkar on 25/08/20.
//

import SwiftUI

struct ContentView: View {

    @State private var petalOffset = -20.0
    @State private var petalWidth = 100.0

    var body: some View {
        VStack {
            Flower(petalOffset: petalOffset, petalWidth: petalWidth)
                .fill(Color.red, style: FillStyle(eoFill: true))
            Text("Offset")
            Slider(value: $petalOffset, in: -40...40)
                .padding([.horizontal, .bottom])
            Text("Width")
            Slider(value: $petalWidth, in: -100...100)
                .padding([.horizontal, .bottom])
        }
    }
}

struct Flower: Shape {

    var petalOffset: Double = -20
    var petalWidth: Double = 100

    func path(in rect: CGRect) -> Path {
        var path = Path()
        for number in stride(from: 0, to: 2 * CGFloat.pi, by: .pi / 8) {
            let rotation = CGAffineTransform(rotationAngle: number)
            let position = rotation.concatenating(
                .init(translationX: rect.width / 2, y: rect.height / 2)
            )
            let rect = CGRect(
                x: CGFloat(petalOffset),
                y: 0,
                width: CGFloat(petalWidth),
                height: rect.width / 2
            )
            let originalPetal = Path(ellipseIn: rect)
            let rotatedPetal = originalPetal.applying(position)
            path.addPath(rotatedPetal)
        }
        return path
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

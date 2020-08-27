//
//  ContentView.swift
//  Drawing
//
//  Created by Prathamesh Kowarkar on 25/08/20.
//

import SwiftUI

struct ContentView: View {

    @State private var rows = 4
    @State private var columns = 4

    var body: some View {
        Checkerboard(rows: rows, columns: columns)
            .onTapGesture {
                withAnimation(.linear(duration: 3)) {
                    self.rows = 8
                    self.columns = 16
                }
            }
    }

}

struct Checkerboard: Shape {

    var rows: Int
    var columns: Int

    public var animatableData: AnimatablePair<Double, Double> {
        get { AnimatablePair(Double(rows), Double(columns)) }
        set {
            self.rows = Int(newValue.first)
            self.columns = Int(newValue.second)
        }
    }

    func path(in rect: CGRect) -> Path {
        var path = Path()
        let rowSize = rect.height / CGFloat(rows)
        let columnSize = rect.width / CGFloat(columns)
        for row in 0 ..< rows {
            for column in 0 ..< columns where (row + column).isMultiple(of: 2) {
                path.addRect(
                    CGRect(
                        x: columnSize * CGFloat(column),
                        y: rowSize * CGFloat(row),
                        width: columnSize,
                        height: rowSize
                    )
                )
            }
        }
        return path
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

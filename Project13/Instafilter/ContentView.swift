//
//  ContentView.swift
//  Instafilter
//
//  Created by Prathamesh Kowarkar on 05/11/20.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI

struct ContentView: View {

    @State private var image: Image?

    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()
        }
        .onAppear(perform: loadImage)
    }

    func loadImage() {

        func filter(with image: UIImage) -> CIFilter {
            let filter = CIFilter.twirlDistortion()
            filter.inputImage = CIImage(image: image)
            filter.radius = 400
            filter.center = CGPoint(x: image.size.width / 2, y: image.size.height / 2)
            return filter
        }

        image = UIImage(named: "Example")
            .map { filter(with: $0) }
            .flatMap { $0.outputImage }
            .flatMap { CIContext().createCGImage($0, from: $0.extent) }
            .map { UIImage(cgImage: $0) }
            .map { Image(uiImage: $0) }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

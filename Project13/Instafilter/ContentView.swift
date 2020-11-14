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
    @State private var filterIntensity = 0.5
    @State private var isShowingImagePicker = false
    @State private var inputImage: UIImage?
    @State private var currentFilter = CIFilter.sepiaTone()
    private let context = CIContext()

    var body: some View {
        let intensity = Binding<Double>(
            get: { filterIntensity },
            set: {
                filterIntensity = $0
                applyProcessing()
            }
        )
        NavigationView {
            VStack {
                ZStack {
                    Color.secondary
                    if let image = image {
                        image
                            .resizable()
                            .scaledToFit()
                    } else {
                        Text("Tap to select a picture.")
                            .font(.headline)
                    }
                }
                .onTapGesture {
                    isShowingImagePicker.toggle()
                }
                HStack {
                    Text("Intensity")
                    Slider(value: intensity)
                }
                .padding(.vertical)
                HStack {
                    Button("Change filter") {
                        //  change filter
                    }
                    Spacer()
                    Button("Save") {
                        //  save the picture
                    }
                }
            }
            .sheet(isPresented: $isShowingImagePicker, onDismiss: loadImage) {
                ImagePicker(image: $inputImage)
            }
            .padding([.horizontal, .bottom])
            .navigationBarTitle("Instafilter")
        }
    }

    func loadImage() {
        guard let inputImage = inputImage else { return }
        let beginImage = CIImage(image: inputImage)
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        applyProcessing()
    }

    func applyProcessing() {
        currentFilter.intensity = Float(filterIntensity)
        guard let outputImage = currentFilter.outputImage else { return }
        if let cgImage = context.createCGImage(outputImage, from: outputImage.extent) {
            let uiImage = UIImage(cgImage: cgImage)
            image = Image(uiImage: uiImage)
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

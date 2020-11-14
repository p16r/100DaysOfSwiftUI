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
    @State private var currentFilter: CIFilter = CIFilter.sepiaTone()
    @State private var isShowingFilterSheet = false
    @State private var processedImage: UIImage?
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
                        isShowingFilterSheet = true
                    }
                    Spacer()
                    Button("Save") {
                        guard let processedImage = processedImage else { return }

                        let imageSaver = ImageSaver()
                        imageSaver.successHandler = {
                            print("Success!")
                        }
                        imageSaver.errorHandler = {
                            print("Error: \($0.localizedDescription)")
                        }

                        imageSaver.writeToPhotoAlbum(image: processedImage)
                    }
                }
            }
            .sheet(isPresented: $isShowingImagePicker, onDismiss: loadImage) {
                ImagePicker(image: $inputImage)
            }
            .actionSheet(isPresented: $isShowingFilterSheet) {
                ActionSheet(
                    title: Text("Select a filter"),
                    buttons: [
                        .default(Text("Crystallize")) {
                            setFilter(.crystallize())
                        },
                        .default(Text("Edges")) {
                            setFilter(.edges())
                        },
                        .default(Text("Gaussian Blur")) {
                            setFilter(.gaussianBlur())
                        },
                        .default(Text("Pixellate")) {
                            setFilter(.pixellate())
                        },
                        .default(Text("Sepia Tone")) {
                            setFilter(.sepiaTone())
                        },
                        .default(Text("Unsharp Mask")) {
                            setFilter(.unsharpMask())
                        },
                        .default(Text("Vignette")) {
                            setFilter(.vignette())
                        },
                    ]
                )
            }
            .padding([.horizontal, .bottom])
            .navigationBarTitle("Instafilter")
        }
    }

    func setFilter(_ filter: CIFilter) {
        currentFilter = filter
        loadImage()
    }

    func loadImage() {
        guard let inputImage = inputImage else { return }
        let beginImage = CIImage(image: inputImage)
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        applyProcessing()
    }

    func applyProcessing() {
        let inputKeys = currentFilter.inputKeys
        if inputKeys.contains(kCIInputIntensityKey) {
            currentFilter.setValue(filterIntensity, forKey: kCIInputIntensityKey)
        }
        if inputKeys.contains(kCIInputRadiusKey) {
            currentFilter.setValue(filterIntensity * 200, forKey: kCIInputRadiusKey)
        }
        if inputKeys.contains(kCIInputScaleKey) {
            currentFilter.setValue(filterIntensity * 10, forKey: kCIInputScaleKey)
        }

        guard let outputImage = currentFilter.outputImage else { return }
        if let cgImage = context.createCGImage(outputImage, from: outputImage.extent) {
            let uiImage = UIImage(cgImage: cgImage)
            image = Image(uiImage: uiImage)
            processedImage = uiImage
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

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
    @State private var filterRadius = 0.5
    @State private var filterScale = 0.5
    @State private var isShowingImagePicker = false
    @State private var inputImage: UIImage?
    @State private var currentFilter: CIFilter = CIFilter.sepiaTone()
    @State private var isShowingFilterSheet = false
    @State private var processedImage: UIImage?
    @State private var isShowingAlert = false
    @State private var filterName: String? = nil
    private let context = CIContext()
    private let filters: [(String, CIFilter)] = [
        ("Crystallize", .crystallize()),
        ("Edges", .edges()),
        ("Gaussian Blur", .gaussianBlur()),
        ("Pixellate", .pixellate()),
        ("Sepia Tone", .sepiaTone()),
        ("Unsharp Mask", .unsharpMask()),
        ("Vignette", .vignette()),
    ]

    var body: some View {
        let intensity = Binding<Double>(
            get: { filterIntensity },
            set: {
                filterIntensity = $0
                applyProcessing()
            }
        )
        let radius = Binding<Double>(
            get: { filterRadius },
            set: {
                filterRadius = $0
                applyProcessing()
            }
        )
        let scale = Binding<Double>(
            get: { filterScale },
            set: {
                filterScale = $0
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
                VStack {
                    HStack {
                        Text("Intensity\t")
                        Slider(value: intensity)
                    }
                    HStack {
                        Text("Radius\t\t")
                        Slider(value: radius)
                    }
                    HStack {
                        Text("Scale\t\t")
                        Slider(value: scale)
                    }
                }
                .padding(.vertical)
                HStack {
                    Button(filterName ?? "Change filter") {
                        isShowingFilterSheet = true
                    }
                    Spacer()
                    Button("Save") {
                        guard let processedImage = processedImage else { return isShowingAlert = true }

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
            .alert(isPresented: $isShowingAlert) {
                Alert(
                    title: Text("Error"),
                    message: Text("No image selected."),
                    primaryButton: .default(Text("Select Image")) {
                        isShowingImagePicker = true
                    },
                    secondaryButton: .cancel()
                )
            }
            .actionSheet(isPresented: $isShowingFilterSheet) {
                ActionSheet(
                    title: Text("Select a filter"),
                    buttons: filters.map { name, filter in
                        .default(Text(name)) {
                            filterName = name
                            setFilter(filter)
                        }
                    }
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
            currentFilter.setValue(filterRadius * 200, forKey: kCIInputRadiusKey)
        }
        if inputKeys.contains(kCIInputScaleKey) {
            currentFilter.setValue(filterScale * 10, forKey: kCIInputScaleKey)
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

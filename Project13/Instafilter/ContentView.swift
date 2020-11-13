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

    var body: some View {
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
                    Slider(value: $filterIntensity)
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
        image = inputImage.map(Image.init(uiImage:))
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

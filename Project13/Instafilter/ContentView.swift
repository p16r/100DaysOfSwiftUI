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
                    //  select image
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
            .padding([.horizontal, .bottom])
            .navigationBarTitle("Instafilter")
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

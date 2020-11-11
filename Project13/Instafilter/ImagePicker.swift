//
//  ImagePicker.swift
//  Instafilter
//
//  Created by Prathamesh Kowarkar on 11/11/20.
//

import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {

    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        UIImagePickerController()
    }

    func updateUIViewController(
        _ uiViewController: UIImagePickerController,
        context: UIViewControllerRepresentableContext<ImagePicker>
    ) {
    }

}

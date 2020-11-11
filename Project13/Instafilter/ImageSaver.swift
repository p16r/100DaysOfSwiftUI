//
//  ImageSaver.swift
//  Instafilter
//
//  Created by Prathamesh Kowarkar on 12/11/20.
//

import UIKit

class ImageSaver: NSObject {

    func writeToPhotoAlbum(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveError), nil)
    }

    @objc func saveError(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        print("Save finished!")
    }

}

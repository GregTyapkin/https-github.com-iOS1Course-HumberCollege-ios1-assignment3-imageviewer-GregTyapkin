//
//  ImageManager.swift
//  Assignment3
//
//  Created by user202478 on 11/13/21.
//

import Foundation

class ImageManager {
    var listOfImages = [ImageInfo]()
    
    func addNewImage(ni:ImageInfo) {
        listOfImages.append(ni)
        }
    
    func getAllImages() -> [ImageInfo]{
        return listOfImages
    }
}

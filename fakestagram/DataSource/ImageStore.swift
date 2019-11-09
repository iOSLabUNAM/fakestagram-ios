//
//  ImageStore.swift
//  fakestagram
//
//  Created by LuisE on 11/8/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//

import Foundation
import UIKit

// Usage
// ImagaStore.permanent.write("filename.jpg", image: img)
// ImagaStore.cache.read("filename.jpg")

enum ImageStore {
    case cache
    case permanent

    var container: DataContainer {
        switch self {
        case .cache:
            return DataContainer.cache
        case .permanent:
            return DataContainer.permanent
        }
    }

    func read(_ filename: String) -> UIImage? {
        if let img = CacheImage.shared.read(key: filename) {
            print(" - Reading from memory")
            return img
        }
        print(" - Reading from disk")
        guard let data = container.read(filename) else { return nil }
        let image = UIImage(data: data)

        print(" * Writting into memory")
        CacheImage.shared.write(key: filename, value: image)
        return image
    }

    func write(_ filename: String, image: UIImage) -> Bool {
        guard let data = image.jpegData(compressionQuality: 0.9) else { return false }

        print(" - Writting into memory")
        CacheImage.shared.write(key: filename, value: image)

        print(" - Writting into disk")
        return container.write(filename, data: data)
    }
}

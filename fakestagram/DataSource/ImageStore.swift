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
            return img
        }
        guard let data = container.read(filename) else { return nil }
        return UIImage(data: data)
    }

    func write(_ filename: String, image: UIImage) -> Bool {
        CacheImage.shared.write(key: filename, value: image)
        guard let data = image.jpegData(compressionQuality: 0.9) else { return false }
        return container.write(filename, data: data)
    }
}

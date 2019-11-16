//
//  UIImage+Base64.swift
//  fakestagram
//
//  Created by LuisE on 10/19/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//

import UIKit

extension Data {
    func imageBase64(ext: String = "tiff") -> String {
        let encoded = self.base64EncodedString(options: .lineLength64Characters)
        return "data:image/\(ext);base64,\(encoded)"
    }
}

extension UIImage {
    func base64() -> String {
        let data = self.jpegData(compressionQuality: 0.85)!
        return data.imageBase64(ext: "jpg")
    }
}

//
//  UIImage+Base64.swift
//  Fakestagram-Xcode10
//
//  Created by Pedro Carlos Monzalvo Navarro on 19/10/19.
//  Copyright © 2019 unam. All rights reserved.
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

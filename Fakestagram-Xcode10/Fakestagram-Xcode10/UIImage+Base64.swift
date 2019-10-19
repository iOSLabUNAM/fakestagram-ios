//
//  UIImage+Base64.swift
//  Fakestagram-Xcode10
//
//  Created by Ricardo Hernández González on 10/19/19.
//  Copyright © 2019 unam. All rights reserved.
//

import UIKit

extension UIImage{
    func toBase64() -> String{
        let data = self.jpegData(compressionQuality: 90)!
        let encoded = data.base64EncodedString(options: .lineLength64Characters)
        return "data:image/jpg;base64,\(encoded)"
    }
}

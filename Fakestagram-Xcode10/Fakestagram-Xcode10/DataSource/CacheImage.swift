//
//  CacheImage.swift
//  Fakestagram-Xcode10
//
//  Created by Pedro Carlos Monzalvo Navarro on 09/11/19.
//  Copyright © 2019 unam. All rights reserved.
//

import Foundation
import UIKit

class CacheImage {
    static let shared = CacheImage()
    private var memCache = NSCache<NSString, UIImage>()

    func read(key: String) -> UIImage? {
        return memCache.object(forKey: key as NSString)
    }

    func write(key: String, value: UIImage?) {
        guard let value = value else { return }
        memCache.setObject(value, forKey: key as NSString)
    }
}

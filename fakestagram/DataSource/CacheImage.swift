//
//  CacheImage.swift
//  fakestagram
//
//  Created by LuisE on 11/8/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
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

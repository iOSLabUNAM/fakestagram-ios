//
//  Like.swift
//  Fakestagram-Xcode10
//
//  Created by Pedro Carlos Monzalvo Navarro on 17/10/19.
//  Copyright © 2019 unam. All rights reserved.
//

import Foundation

struct Like: Codable {
    let author: Author
}

struct LikeServiceResponse: Codable {
    var id: Int?
    var author: Author?
    var createdAt: String?
    var updatedAt: String?
}

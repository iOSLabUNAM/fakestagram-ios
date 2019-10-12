//
//  Comment.swift
//  Fakestagram-Xcode10
//
//  Created by Ricardo Hernandez D4 on 10/12/19.
//  Copyright © 2019 unam. All rights reserved.
//

import Foundation

struct Comment: Codable {
    let content: String
    let author: Author?
}

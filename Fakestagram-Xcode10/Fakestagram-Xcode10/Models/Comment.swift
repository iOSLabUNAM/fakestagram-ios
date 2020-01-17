//
//  Comment.swift
//  Fakestagram-Xcode10
//
//  Created by Pedro Carlos Monzalvo Navarro on 17/10/19.
//  Copyright © 2019 unam. All rights reserved.
//

import Foundation

struct Comment: Codable {
    let content: String
    let author: Author?
}

struct CommentServiceResponse: Codable{
    let commentID: Int
    let content: String
    let created_at: String
    let updated_at: String
    let author: String
    let name: String
}


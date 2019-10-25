//
//  Account.swift
//  fakestagram
//
//  Created by LuisE on 10/5/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//

import Foundation

struct Account: Codable {
    let id: String?
    let name: String
    let deviceNumber: String?
    let deviceModel: String?
}

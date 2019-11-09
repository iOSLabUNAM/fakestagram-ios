//
//  Credentials.swift
//  fakestagram
//
//  Created by LuisE on 10/4/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//

import Foundation
import SAMKeychain

enum Credentials {
    case apiToken

    func get() -> String? {
        switch self {
        case .apiToken:
            return SAMKeychain.password(forService: "mx.unam.fakestagram", account: "apiToken")
        }
    }

    func set(value: String) -> Bool {
        switch self {
        case .apiToken:
            SAMKeychain.setPassword(value, forService: "mx.unam.fakestagram", account: "apiToken")
        }
        return true
    }

    func destroy() -> Bool {
        switch self {
        case .apiToken:
            SAMKeychain.deletePassword(forService: "mx.unam.fakestagram", account: "apiToken")
        }
        return true
    }
}

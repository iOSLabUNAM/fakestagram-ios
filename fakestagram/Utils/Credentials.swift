//
//  Credentials.swift
//  fakestagram
//
//  Created by LuisE on 10/4/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//

import Foundation

enum Credentials {
    case apiToken

    func get() -> String? {
        switch self {
        case .apiToken:
            return UserDefaults.standard.string(forKey: "apiToken")
        }
    }

    func set(value: String) -> Bool {
        switch self {
        case .apiToken:
            UserDefaults.standard.set(value, forKey: "apiToken")
        }
        return true
    }

    func destroy() -> Bool {
        switch self {
        case .apiToken:
            UserDefaults.standard.setNilValueForKey("apiToken")
        }
        return true
    }
}

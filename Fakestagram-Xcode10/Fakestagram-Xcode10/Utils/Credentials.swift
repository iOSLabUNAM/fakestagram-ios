//
//  Credentials.swift
//  Fakestagram-Xcode10
//
//  Created by Pedro Carlos Monzalvo Navarro on 10/4/19.
//  Copyright © 2019 unam. All rights reserved.
//

import Foundation

enum Credentials {
    case apiToken

    func get() -> String? {
        switch self {
        case .apiToken:
            return UserDefaults.standard.string(forKey: "apiToken")
            //return "f41af9b1-5a7e-4f0b-8c88-e44f686b1d2e"
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


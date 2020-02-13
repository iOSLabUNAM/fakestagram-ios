//
//  NotificationNames.swift
//  fakestagram
//
//  Created by LuisE on 11/16/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//

import Foundation

enum NotificationKeys {
    case didFinishPostCreation
    
    var value: Notification.Name {
        switch self {
        case .didFinishPostCreation:
            return Notification.Name(rawValue: "didFinishPostCreationNotification")
        }
    }
}

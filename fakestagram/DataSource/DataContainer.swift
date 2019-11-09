//
//  DataContainer.swift
//  fakestagram
//
//  Created by LuisE on 11/8/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//

import Foundation

// Usage
// DataContainer.cache.write("file.json",data: parsedData)
// DataContainer.cache.read("file.png")
// DataContainer.permanent.write("file.json",data: parsedData)
// DataContainer.permanent.read("file.png")
enum DataContainer {
    case cache
    case permanent

    var baseUrl: URL {
        switch self {
        case .cache:
            StorageType.cache.ensureExists()
            return StorageType.cache.url
        case .permanent:
            StorageType.permanent.ensureExists()
            return StorageType.permanent.url
        }
    }

    func read(_ filename: String) -> Data? {
        let url = urlFor(filename: filename)
        return try? Data(contentsOf: url)
    }

    func write(_ filename: String, data: Data) -> Bool {
        do {
            try data.write(to: urlFor(filename: filename))
            return true
        } catch let err {
            debugPrint("Error: \(err.localizedDescription)")
            return false
        }
    }

    func urlFor(filename: String) -> URL {
        var url = baseUrl
        url.appendPathComponent(filename)
        return url
    }

}

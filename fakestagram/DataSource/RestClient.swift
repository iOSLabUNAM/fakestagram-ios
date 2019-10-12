//
//  RestClient.swift
//  fakestagram
//
//  Created by LuisE on 10/5/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//

import Foundation

class RestClient<T: Codable> {
    private let client: Client
    let basePath: String
    let encoder: JSONEncoder = {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        return encoder
    }()

    init(client: Client, basePath: String) {
        self.client = client
        self.basePath = basePath
    }

    // eg. POST /posts/
    func create(_ data: T, success: @escaping (T?) -> Void) {
        let payload = try? encoder.encode(data)
        client.post(path: basePath, body: payload) { data in
            CodableSerializer(data: data).async(result: success)
        }
    }

    // eg. GET /posts/
    // eg. GET /posts/:id
    func show(id: String? = nil, success: @escaping (T?) -> Void) {
        var path = basePath
        if let uid = id {
            path += "/\(uid)"
        }
        client.get(path: path) { data in
            CodableSerializer(data: data).async(result: success)
        }
    }
    // eg. PUT /posts/:id
    func update(id: String, data: T, success: @escaping (T?) -> Void) {
        let payload = try? encoder.encode(data)
        client.put(path: "\(basePath)/\(id)", body: payload) { data in
            CodableSerializer(data: data).async(result: success)
        }
    }

    // eg. DELETE /posts/:id
    func delete(id: String, success: @escaping (T?) -> Void) {
        client.delete(path: "\(basePath)/\(id)") { data in
            CodableSerializer(data: data).async(result: success)
        }
    }
}

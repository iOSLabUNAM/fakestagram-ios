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

    let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()

    init(client: Client, basePath: String) {
        self.client = client
        self.basePath = basePath
    }

    // eg. POST /posts/
    func create(_ data: T, success: @escaping (T?) -> Void) {
        let payload = try? encoder.encode(data)
        client.post(path: basePath, body: payload) { [unowned self] data in
                   guard let data = data else {
                       success(nil)
                       return
                   }
                   do {
                       let json = try self.decoder.decode(T.self, from: data)
                       success(json)
                   } catch let err {
                       print("Invalid JSON format: \(err.localizedDescription)")
                   }
               }

    }

    // eg. GET /posts/
    // eg. GET /posts/:id
    func show(id: String? = nil, success: @escaping (T?) -> Void) {
        var path = basePath
        if let uid = id {
            path += "/\(uid)"
        }
        client.get(path: path) { [unowned self] data in
            guard let data = data else {
                DispatchQueue.main.async { success(nil) }
                return
            }
            do {
                let json = try self.decoder.decode(T.self, from: data)
                DispatchQueue.main.async { success(json) }
            } catch let err {
                print("Invalid JSON format: \(err.localizedDescription)")
            }
        }
    }
    // eg. PUT /posts/:id
    func update(id: String, data: T, success: @escaping (T?) -> Void) {
        let payload = try? encoder.encode(data)
        client.put(path: "\(basePath)/\(id)", body: payload) { [unowned self] data in
            guard let data = data else {
                success(nil)
                return
            }
            do {
                let json = try self.decoder.decode(T.self, from: data)
                success(json)
            } catch let err {
                print("Invalid JSON format: \(err.localizedDescription)")
            }
        }
    }


    // eg. DELETE /posts/:id
    func delete(id: String, success: @escaping (T?) -> Void) {
        client.delete(path: "\(basePath)/\(id)") { [unowned self] data in
                guard let data = data else {
                    success(nil)
                    return
                }
                do {
                    let json = try self.decoder.decode(T.self, from: data)
                    success(json)
                } catch let err {
                    print("Invalid JSON format: \(err.localizedDescription)")
                }
            }
    }

}

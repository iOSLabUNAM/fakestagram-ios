//
//  LikeService.swift
//  Fakestagram-Xcode10
//
//  Created by Pedro Carlos Monzalvo Navarro on 16/12/19.
//  Copyright © 2019 unam. All rights reserved.
//

import Foundation

enum LikeServiceAction {
    case create, getLikes
}

class LikeService {
    
    var postID = ""
    
    var client = Client.fakestagram
    
    init(withPostID postID: String) {
        self.postID = postID
    }
    
    func call(success: @escaping (Any?) -> Void, withAction action: LikeServiceAction) {
        guard !postID.isEmpty else {
            success(nil)
            return
        }
        switch action {
        case .create:
            createLike(forPost: postID, success: success)
        default:
            getLikes(forPost: postID, success: success)
        }
        
    }
    
    private func createLike(forPost postId: String, success: @escaping (LikeServiceResponse?) -> Void) {
        let path = "/api/v1/posts/\(postID)/like"
        Client.fakestagram.post(path: path, body: nil) {
            guard let response = $0, let responseModel = try? JSONDecoder().decode(LikeServiceResponse.self, from: response) else {
                success(nil)
                return
            }
            success(responseModel)
        }
    }
    
    private func getLikes(forPost postId: String, success: @escaping ([LikeServiceResponse]?) -> Void) {
        let path = "/api/v1/posts/\(postID)/likes"
        Client.fakestagram.get(path: path) {
            guard let response = $0, let responseModel = try? JSONDecoder().decode([LikeServiceResponse].self, from: response) else {
                success(nil)
                return
            }
            success(responseModel)
        }
    }
    
}


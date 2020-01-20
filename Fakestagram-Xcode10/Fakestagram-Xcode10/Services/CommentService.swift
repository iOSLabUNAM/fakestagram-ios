//
//  CommentService.swift
//  Fakestagram-Xcode10
//
//  Created by Pedro Carlos Monzalvo Navarro on 16/12/19.
//  Copyright © 2019 unam. All rights reserved.
//

import Foundation

enum CommentServiceAction {
    case get,create
}

var postID = ""

class CommentService{
    
    func call(success: @escaping (Any?) -> Void, withAction action: CommentServiceAction){
        guard !postID.isEmpty else {
            success(nil)
            return
        }
        switch action {
        case .create:
            createComment(forPost: postID, success: success)
        default:
            getComment(forPost: postID, success: success)
        }
    }
    
    func createComment(forPost postId: String, success: @escaping (CommentServiceResponse?) -> Void){
        let path = "/api/v1/posts/\(postID)/comments"
        Client.fakestagram.post(path: path, body: nil) {
            guard let response = $0, let responseModel = try? JSONDecoder().decode(CommentServiceResponse.self, from: response) else {
                success(nil)
                return
            }
            success(responseModel)
        }
    }
    
    func getComment(forPost postId: String, success: @escaping ([CommentServiceResponse]?) -> Void){
        let path = "/api/v1/posts/\(postID)/comments"
        Client.fakestagram.get(path: path) {
            guard let response = $0, let responseModel = try? JSONDecoder().decode([CommentServiceResponse].self, from: response) else { success(nil); return }
            success(responseModel)
        }
    }
    
}

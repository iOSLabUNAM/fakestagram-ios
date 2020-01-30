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

class CommentService{
    
    var postID = ""
    
    let encoder: JSONEncoder = {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        return encoder
    }()
    
    func call(success: @escaping (Any?) -> Void, withAction action: CommentServiceAction, and comment: String = ""){
        guard !postID.isEmpty else {
            success(nil)
            return
        }
        switch action {
        case .create:
            createComment(forPost: postID, content: comment, success: success)
        default:
            getComment(forPost: postID, success: success)
        }
    }
    
    func createComment(forPost postID: String, content: String, success: @escaping (CommentServiceResponse?) -> Void){
        let path = "/api/v1/posts/\(postID)/comments"
        let body = try? encoder.encode(Comment(content: content, author: nil))
        Client.fakestagram.post(path: path, body: body) {
            guard let response = $0, let responseModel = try? JSONDecoder().decode(CommentServiceResponse.self, from: response) else {
                success(nil)
                return
            }
            success(responseModel)
        }
    }
    
    func getComment(forPost postID: String, success: @escaping ([CommentServiceResponse]?) -> Void){
        let path = "/api/v1/posts/\(postID)/comments" 
        Client.fakestagram.get(path: path) {
            guard let response = $0, let responseModel = try? JSONDecoder().decode([CommentServiceResponse].self, from: response) else { success(nil); return }
            success(responseModel)
        }
    }
    
}

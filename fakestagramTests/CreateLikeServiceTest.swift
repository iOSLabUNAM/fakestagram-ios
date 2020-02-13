//
//  CreateLikeServiceTest.swift
//  fakestagramTests
//
//  Created by Jhovan Gallardo on 12/02/20.
//  Copyright © 2020 3zcurdia. All rights reserved.
//

import XCTest
@testable import fakestagram

class CreateLikeServiceTest: XCTestCase {
    
    var postId: Int = 0
    var posts: [Post]? = []
    
    func testInvalidLike() {
        let likeSertvice = CreateLikeService()
        XCTAssertNoThrow(likeSertvice.call(postId:"Invalid PostId"){_ in })
    }
    
    
    // La idea era verificar el número de likes en un post
    // pero no se exactamente porque ningun servicio esta haciendo lo que deberia
    func testCreateLike() {
        // crea un post
        let postService = CreatePostService()
        postService.call(image: UIImage(named: "test_picture")!, title: "Prueba") {postId in self.postId = postId!}
        // crea un like para el post creado
        let likeSertvice = CreateLikeService()
        likeSertvice.call(postId: String(self.postId)){_ in }
        let indexService = IndexService()
        indexService.call { [unowned self] data in
            self.posts = data
        }
        guard let posts = self.posts else {return}
        var likes = 0
        // busca el post creado y obtiene su numero de likes
        for post in posts {
            if post.id == self.postId {
                likes = post.likesCount
                break
            }
        }
        XCTAssertEqual(likes, 1)
        
    }
    
    // La idea era verificar el número de likes en un post
    // pero no se exactamente porque ningun servicio esta haciendo lo que deberia
    func testRepeatedLike() {
        // crea un post
        let postService = CreatePostService()
        postService.call(image: UIImage(named: "test_picture")!, title: "Prueba") {postId in self.postId = postId!}
        let likeSertvice = CreateLikeService()
        // hace like dos veces sobre el post creado
        likeSertvice.call(postId: String(self.postId)){_ in }
        likeSertvice.call(postId: String(self.postId)){_ in }
        let indexService = IndexService()
        indexService.call { [unowned self] data in
            self.posts = data
        }
        guard let posts = self.posts else {return}
        var likes = 0
        // busca el post creado y obtiene su numero de likes
        for post in posts {
            if post.id == self.postId {
                likes = post.likesCount
                break
            }
        }
        XCTAssertEqual(likes, 1)
    }
    
    
}

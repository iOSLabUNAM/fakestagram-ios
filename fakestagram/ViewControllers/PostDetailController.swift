//
//  PostDetailController.swift
//  fakestagram
//
//  Created by Ma. de Lourdes Chaparro Candiani on 11/23/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//

import UIKit

class PostDetailController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    var postData: Post!
    let commentsService = CommentsService()
    
    var comments: [Comment]? {
        didSet {
            self.commentsTable.reloadData()
        }
    }
    
    let postImage: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    let postTitle: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = .white
        titleLabel.font = UIFont(name: "Marker Felt", size: 25)
       return titleLabel
    }()
    
    let likesCounter: UILabel = {
        let likesLabel = UILabel()
         likesLabel.translatesAutoresizingMaskIntoConstraints = false
         likesLabel.textColor = .white
         likesLabel.font = UIFont(name: "Marker Felt", size: 25)
        return likesLabel
    }()
    
    let commentsTable: UITableView = {
       let comments = UITableView()
        comments.translatesAutoresizingMaskIntoConstraints = false
        return comments
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(postImage)
        view.addSubview(postTitle)
        view.addSubview(likesCounter)
        view.addSubview(commentsTable)
        
        postImage.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        postImage.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        postImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 80).isActive = true
        postImage.heightAnchor.constraint(equalToConstant: 340).isActive = true
        
        postTitle.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 15).isActive = true
        postTitle.leftAnchor.constraint(equalTo: postImage.leftAnchor).isActive = true
        postTitle.heightAnchor.constraint(equalToConstant: 40).isActive = true
        postTitle.widthAnchor.constraint(equalToConstant: 340).isActive = true
        
        likesCounter.topAnchor.constraint(equalTo: postTitle.bottomAnchor).isActive = true
        likesCounter.leftAnchor.constraint(equalTo: postTitle.leftAnchor).isActive = true
        likesCounter.heightAnchor.constraint(equalToConstant: 40).isActive = true
        likesCounter.widthAnchor.constraint(equalToConstant: 250).isActive = true
        
        commentsTable.topAnchor.constraint(equalTo: likesCounter.bottomAnchor, constant: 20).isActive = true
        commentsTable.leftAnchor.constraint(equalTo: likesCounter.leftAnchor).isActive = true
        
        postTitle.text = postData.title
        likesCounter.text = postData.likesCountText()
        postData.load { [unowned self] img in
            self.postImage.image = img
        }
        commentsService.getComments(postId: postData.id!) { [unowned self] data in
            self.comments = data
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return comments?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }

}

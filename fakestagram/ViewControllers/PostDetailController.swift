//
//  PostDetailController.swift
//  fakestagram
//
//  Created by Ma. de Lourdes Chaparro Candiani on 11/23/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//

import UIKit

class PostDetailController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var postData: Post!
    let commentsService = CommentsService()
    let cellIdentifier = "commentCell"
    
    var comments: [Comment]? {
        didSet {
            self.commentsTable.reloadData()
        }
    }
    
    let postImage: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    
    let postTitle: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = .white
        titleLabel.font = UIFont(name: "System Semibold", size: 25)
       return titleLabel
    }()
    
    let likesCounter: UILabel = {
        let likesLabel = UILabel()
         likesLabel.translatesAutoresizingMaskIntoConstraints = false
         likesLabel.textColor = .white
         likesLabel.font = UIFont(name: "System", size: 25)
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
        postImage.heightAnchor.constraint(equalToConstant: 400).isActive = true
        
        postTitle.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 10).isActive = true
        postTitle.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        postTitle.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        postTitle.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        likesCounter.topAnchor.constraint(equalTo: postTitle.bottomAnchor).isActive = true
        likesCounter.leftAnchor.constraint(equalTo: postTitle.leftAnchor).isActive = true
        likesCounter.heightAnchor.constraint(equalToConstant: 30).isActive = true
        likesCounter.widthAnchor.constraint(equalToConstant: 250).isActive = true
        
        commentsTable.topAnchor.constraint(equalTo: likesCounter.bottomAnchor, constant: 10).isActive = true
        commentsTable.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        commentsTable.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        commentsTable.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        commentsTable.register(CommentTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        commentsTable.dataSource = self
        commentsTable.delegate = self
        
        postTitle.text = postData.title
        likesCounter.text = postData.likesCountText()
        postData.load { img in
            self.postImage.image = img
        }
        
        commentsService.getComments(postId: postData.id!) { data in
                   self.comments = data
               }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = commentsTable.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        guard let comments = self.comments else {return cell}
        cell.textLabel?.text = comments[indexPath.row].content
        cell.detailTextLabel?.text = comments[indexPath.row].author!.name
        return cell
    }

}

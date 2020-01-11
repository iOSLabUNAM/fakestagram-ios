//
//  PostCollectionViewCell.swift
//  fakestagram
//
//  Created by LuisE on 10/18/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//

import UIKit

class PostCollectionViewCell: UICollectionViewCell {
    static let identifier: String = "PostCell"
    public var post: Post? {
        didSet {
            updateView()
        }
    }
    
    public var comment : Comment? {
        didSet {
            updateView()
        }
    }
    
    @IBOutlet weak var authorView: AuthorView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var likeCounter: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var likeBttn: UIButton!
    @IBOutlet weak var commentBttn: UIButton!

    @IBOutlet weak var postCommentBttn: UIButton!
    
    @IBOutlet weak var showCommentLabel: UILabel!
    
    @IBOutlet weak var writeComment: UITextField!
    
    
    func reset() {
        self.imageView.image = nil
        self.likeCounter.text = ""
        self.titleLabel.text = ""
        self.showCommentLabel.text = ""
        self.writeComment.text = ""
    }

    func updateView() {
        reset()
        guard let post = self.post else { return }
        self.authorView.author = post.author
        self.titleLabel.text = post.title
        self.likeCounter.text = post.likesCountText()
    
        post.load { [unowned self] img in
            self.imageView.image = img
        }
        
        self.writeComment.isEnabled = false
        self.writeComment.isHidden = true
        self.postCommentBttn.isEnabled = false
        self.postCommentBttn.isHidden = true
        
        guard let comment = self.comment else { return }
        self.showCommentLabel.text = post.commentsCountText() + " " + comment.content
        
    }
    
    @IBAction func tapLike(_ sender: UIButton) {
        let service = CreateLikeService()
        guard let post = self.post else { return }
        service.call(postID: post.id) { postId in
        print("NewLike")
        print(postId ?? -1)
        }
    }
    
    @IBAction func tapComment(_ sender: UIButton) {
       self.writeComment.isEnabled = true
       self.writeComment.isHidden = false
       self.postCommentBttn.isEnabled = true
       self.postCommentBttn.isHidden = false
    }

    @IBAction func postComment(_ sender: UIButton) {

        self.writeComment.isEnabled = false
        self.writeComment.isHidden = true
        self.postCommentBttn.isEnabled = false
        self.postCommentBttn.isHidden = true

        let commentService = CommentsService()
        guard let comment = self.comment else { return }
        commentService.call(postID: comment.content){data in
            print(self.writeComment.text ?? "noppe")
        }

        
    }
    
    
    
    

}

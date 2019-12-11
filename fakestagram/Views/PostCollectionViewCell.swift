//
//  PostCollectionViewCell.swift
//  fakestagram
//
//  Created by LuisE on 10/18/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//

import UIKit

class PostCollectionViewCell: UICollectionViewCell {
    
    weak var delegate:PostsViewController?
    static let identifier: String = "PostCell"
    public var post: Post? {
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
    @IBOutlet weak var commentCounter: UILabel!
    

    func reset() {
        self.imageView.image = nil
        self.likeCounter.text = ""
        self.titleLabel.text = ""
    }

    func updateView() {
        reset()
        guard let post = self.post else { return }
        self.authorView.author = post.author
        self.titleLabel.text = post.title
        self.likeCounter.text = post.likesCountText()
        self.commentCounter.text = post.commentsCountText()
        post.load { [unowned self] img in
            self.imageView.image = img
        }
    }

    
    

    
    @IBAction func likeAction(_ sender: UIButton) {
   
            let service = AddLikeService()
            service.call(postId: post?.id) { (post) in
                print("success")
            }

        }

        @IBAction func commentAction(_ sender: UIButton) {
            
            let comentsCollectionView = CollectionViewController(collectionViewLayout: UICollectionViewLayout())
//            let navigation = UINavigationController(rootViewController: comentsCollectionView)
//            delegate?.present(navigation, animated: true, completion: nil)
            delegate?.navigationController?.pushViewController(comentsCollectionView, animated: true)
            
            
            
            print("comment")
        }

    
}

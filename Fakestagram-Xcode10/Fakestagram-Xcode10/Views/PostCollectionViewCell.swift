//
//  PostCollectionViewCell.swift
//  Fakestagram-Xcode10
//
//  Created by Pedro Carlos Monzalvo Navarro on 18/10/19.
//  Copyright © 2019 unam. All rights reserved.
//

import UIKit

class PostCollectionViewCell: UICollectionViewCell {

    static let identifier: String = "PostCell"
    public var post: Post? {
        didSet {
            updateView()
        }
    }
    
    var delegate: PostCollectionCellDelegate?

    @IBOutlet weak var loveImageView: UIImageView!
    @IBOutlet weak var authorView: AuthorView!
    @IBOutlet weak var imageContainerView: UIView! {
        didSet {
            imageContainerView.dropShadow()
        }
    }
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var likeCounter: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var likeBttn: UIButton!
    @IBOutlet weak var commentBtn: UIButton!

    @IBAction func onTapLike(_ sender: Any?){
        guard let post = self.post else { return }
        animateHeartBeat()
        delegate?.didTapLike(onPost: post, withinCell: self)
    }
    
    @IBAction func onTapCreateComment(_ sender: Any?){
        guard let post = self.post else { return }
        delegate?.didComment(onPost: post, withinCell: self)
    }
    
    @IBAction func onTapShowComment(_ sender: Any?){
        guard let post = self.post else { return }
        delegate?.didTapShowComment(onPost: post, withinCell: self)
        
    }
    
    override func prepareForReuse() {
        reset()
    }

    private func reset() {
        self.imageView.image = nil
        self.likeCounter.text = ""
        self.titleLabel.text = ""
    }
    
    func updatePost(withLikes numberOfLikes: Int) {
        post?.likesCount = numberOfLikes
        updateView()
    }

    func updateView() {
        DispatchQueue.main.async {
            guard let post = self.post else { return }
            self.authorView.author = post.author
            self.titleLabel.text = post.title
            self.likeCounter.text = post.likesCountText()
            post.load { [weak self] img in
                guard let self = self ,self.imageView.image == nil else { return }
                self.imageView.image = img
            }
        }
    }
    
    func animateHeartBeat(){
        let animation = CAKeyframeAnimation(keyPath: "transform.scale")
        animation.values = [1.0, 1.2, 1.0]
        animation.keyTimes = [0, 0.5, 1]
        animation.duration = 1.0
        animation.repeatCount = Float.infinity
        
        loveImageView.layer.add(animation, forKey: "pulse")
        UIView.transition(with: loveImageView, duration: 0.8, options: .transitionCrossDissolve, animations: {
            self.loveImageView.alpha = 1
        }, completion: nil)
        
        UIView.animate(withDuration: 0.4, delay: 1, options: [], animations: {
            self.loveImageView.alpha = 0
        }, completion: nil)
    }
}

protocol PostCollectionCellDelegate {
    func didTapLike(onPost post: Post, withinCell cell: PostCollectionViewCell)
    func didComment(onPost post: Post, withinCell cell: PostCollectionViewCell)
    func didTapShowComment(onPost post: Post, withinCell cell: PostCollectionViewCell)
}

 extension UIView {

    func dropShadow() {
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.layer.shadowRadius = 5
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale

    }
}

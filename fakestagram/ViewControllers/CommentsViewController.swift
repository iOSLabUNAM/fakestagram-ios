//
//  CommentsViewController.swift
//  fakestagram
//
//  Created by Pedro Antonio Vazquez Rodriguez on 11/12/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//

import UIKit

class CommentsViewController: UIViewController {

    @IBOutlet weak var postButton: UIButton!
    @IBOutlet weak var commetnTextField: UITextField!
    @IBOutlet weak var commentsCollectionView: UICollectionView!
    var postId: Int?
    var comments: [Comment]?{
        didSet{
            self.commentsCollectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        commentsCollectionView.delegate = self

        commentsCollectionView.dataSource = self
        
        commentsCollectionView.register(UINib(nibName: "CommentsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: CommentsCollectionViewCell.identifier)
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        fetchData()
        
        }

    @IBAction func postComment(_ sender: Any) {
        guard let msn = commetnTextField.text, let id = postId else {return}
        if  msn != ""{
        let service = AddCommentService()
                   service.call(postId: id, content: msn) { (post) in
                    self.commetnTextField.text = ""
                       print("success")
                   }
        }
        fetchData()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func fetchData(){
        guard let id = postId else{return}
         let service = GetCommentService()
         service.call(postId: id) { [unowned self] data in
            self.comments = data
         }
    }
    
}


extension CommentsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return comments?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = commentsCollectionView.dequeueReusableCell(withReuseIdentifier: CommentsCollectionViewCell.identifier, for: indexPath) as! CommentsCollectionViewCell
        cell.commentsTextView.text = comments?[indexPath.item].content
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        
    }
    
    
}

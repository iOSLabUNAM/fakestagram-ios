//
//  CollectionViewController.swift
//  fakestagram
//
//  Created by Pedro Antonio Vazquez Rodriguez on 10/12/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//

import UIKit



class CollectionViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout {
    
    var commentView :UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    var commentTextField: UITextField  = {
        let textField = UITextField()
            textField.placeholder = "Agrega un comentario"
            textField.backgroundColor = .white
        return textField
    }()
    
    var commentButton: UIButton = {
        let button  = UIButton()
        button.setTitle("Publicar", for: .normal)
        button.tintColor = .blue
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setViews()
        collectionView.backgroundColor = .white
        
        collectionView.delegate = self
        collectionView.dataSource = self
       
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        
        self.collectionView!.register(UINib(nibName: String(describing: CommentsCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: CommentsCollectionViewCell.identifier)

        // Do any additional setup after loading the view.
    }

    func setViews()  {
         view.addSubview(commentView)
               commentView.setConstraintsToBordersAndSizes(topAnchor: nil, bottomAnchor: view.safeAreaLayoutGuide.bottomAnchor, leftAnchor: view.leftAnchor, rightAnchor: view.rightAnchor, width: nil, height: 50)
               commentView.addSubview(commentTextField)
               commentView.addSubview(commentButton)
               commentButton.setConstraintsToBordersAndSizes(topAnchor: commentView.topAnchor, bottomAnchor: commentView.bottomAnchor, leftAnchor: nil, rightAnchor: commentView.rightAnchor, width: 70, height: nil,padding: UIEdgeInsets(top: 2, left: 0, bottom: 2, right: -15))
               
               commentTextField.setConstraintsToBordersAndSizes(topAnchor: commentView.topAnchor, bottomAnchor: commentView.bottomAnchor, leftAnchor: commentView.leftAnchor, rightAnchor: commentButton.leftAnchor, width: nil, height: nil,padding: UIEdgeInsets(top: 2, left: 5, bottom: 2, right: 0))
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 10
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CommentsCollectionViewCell.identifier, for: indexPath) as! CommentsCollectionViewCell
            cell.backgroundColor = .blue
        // Configure the cell
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */
    
}

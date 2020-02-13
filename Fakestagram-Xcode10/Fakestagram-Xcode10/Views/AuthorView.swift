//
//  AuthorView.swift
//  Fakestagram-Xcode10
//
//  Created by Ricardo Hernandez D4 on 10/12/19.
//  Copyright © 2019 unam. All rights reserved.
//

import UIKit

@IBDesignable
class AuthorView: UIView{
    var author: Author? {
        didSet { updateContent() }
    }
    
    private let avatar: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "profile-2")
//        iv.backgroundColor =
        iv.contentMode = .scaleToFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private let nameLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Lorem ipsum"
        lbl.font = UIFont.systemFont(ofSize: 32)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    convenience init() {
        self.init(frame: .zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupConstraints()
    }
    
    func setupConstraints(){
        addSubview(avatar)
//        avatar.topAnchor.constraint(equalTo: self.topAnchor, constant: 3).isActive = true
//        Para evitar estar haciendo isActive por cada constraint utilizamos NSLayoutConstraint.activate
        NSLayoutConstraint.activate([
            avatar.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            avatar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            avatar.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
            avatar.widthAnchor.constraint(equalToConstant: 90)
//            avatar.heightAnchor.constraint(equalToConstant: self.frame.height-6)
        ])
        
        addSubview(nameLbl)
        NSLayoutConstraint.activate([
            nameLbl.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: 5),
            nameLbl.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            nameLbl.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    func updateContent() {
        guard let uauthor = author else { return }
        nameLbl.text = uauthor.name
    }
}

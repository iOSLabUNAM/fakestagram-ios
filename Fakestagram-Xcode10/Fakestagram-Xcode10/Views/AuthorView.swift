//
//  AuthorView.swift
//  Fakestagram-Xcode10
//
//  Created by Ricardo Hernandez D4 on 10/12/19.
//  Copyright © 2019 unam. All rights reserved.
//

import UIKit

class AuthorView: UIView{
    let avatar: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "")
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let nameLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Lorem ipsum"
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
            avatar.topAnchor.constraint(equalTo: self.topAnchor, constant: 3),
            avatar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 3),
            avatar.bottomAnchor.constraint(equalTo: self.bottomAnchor),
//            avatar.heightAnchor.constraint(equalToConstant: self.frame.height-6)
        ])
        
        addSubview(nameLbl)
        NSLayoutConstraint.activate([
            nameLbl.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: 5),
            nameLbl.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 3),
            nameLbl.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}

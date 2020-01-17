//
//  ShutterButton.swift
//  Fakestagram-Xcode10
//
//  Created by Pedro Carlos Monzalvo Navarro on 16/12/19.
//  Copyright © 2019 unam. All rights reserved.
//

import UIKit

class ShutterButton: UIButton {
    
    var centerView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        self.layer.borderWidth = 5
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = self.frame.height / 2
        
        centerView.frame = frame
        centerView.transform = CGAffineTransform.init(scaleX: 0.8, y: 0.8)
        centerView.backgroundColor = .lightGray
        self.addSubview(centerView)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.backgroundColor = .clear
        self.layer.borderWidth = 5
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = self.frame.height / 2
        
        centerView.frame = frame
        centerView.transform = CGAffineTransform.init(scaleX: 0.8, y: 0.8)
        centerView.backgroundColor = .lightGray
        self.addSubview(centerView)
    }
    
}

//
//  RequestBuilder.swift
//  Fakestagram-Xcode10
//
//  Created by Pedro Carlos Monzalvo Navarro on 10/5/19.
//  Copyright © 2019 unam. All rights reserved.
//

import Foundation

struct RequestBuilder{
    var baseUrl: String = ""
    var path: String = ""
    var method: String = "get"
    var scheme: String = "https"
    var urlComp  : URLComponents
    
    init(baseUrl: String){
        self.urlComp = URLComponents(string: baseUrl)!
        self.baseUrl = baseUrl
    }
    
    mutating func url() ->  URL? {
        var u = urlComp
        u.path = self.path
        u.scheme = self.scheme
        
        return u.url
        //        return URL(string: "\(baseUrl)\(path)")
        
    }
    
}

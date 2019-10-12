//
//  HttpResponse.swift
//  Fakestagram-Xcode10
//
//  Created by Ricardo Hernandez D4 on 10/12/19.
//  Copyright © 2019 unam. All rights reserved.
//

import Foundation

class HttpResponse {
    let httpUrlResponse: HTTPURLResponse
    
    init(response: URLResponse?) {
        self.httpUrlResponse = response as! HTTPURLResponse
    }
    
    lazy var status: StatusCode = {
        return StatusCode(rawValue: self.httpUrlResponse.statusCode)
    }()
    
    func isSuccessful() -> Bool {
        return status == StatusCode.success
    }
}

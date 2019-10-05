//
//  Cliente.swift
//  Fakestagram-Xcode10
//
//  Created by Pedro Carlos Monzalvo Navarro on 10/4/19.
//  Copyright © 2019 unam. All rights reserved.
//

import Foundation

class Cliente{
    let session: URLSession
    let baseUrl : URL
    let contentType: String
    
    init(session: URLSession, baseUrl: URL, contentType: String) {
        self.session = session
        self.baseUrl = baseUrl
        self.contentType = contentType
    }
    
    typealias successfulResponse = (Data) -> Void
    
    func get(path: String, success: successfulResponse){}
    
    func post(path: String,body: Data?, success: successfulResponse){}
    
    func put (path: String,body: Data?, success: successfulResponse){}
    
    func delete(path: String, success: successfulResponse){}
    
    func request(method: String, path: String,body: Data?,success: successfulResponse) {
        
        let req = buildRequest(method: method, path: path,body: body)
        
        session.dataTask(with: req){ (data, response,error) in
            if let error = error {
                debugPrint(error)
                return
            }
            let res = ClientResponse(response)
            if res.successful? {
                
            }
            }.resume()
        
    }
    
    private func buildRequest(method: String, path: String,body : Data?) -> URLRequest{
        var urlComponents = URLComponents(url: self.baseUrl, resolvingAgainstBaseURL: true)!
        urlComponents.path = path
        var request = URLRequest(url: urlComponents.url!)
        request.setValue(contentType, forHTTPHeaderField: "Accept")
        request.setValue(contentType, forHTTPHeaderField: "Content-Type")
        request.httpMethod = method
        
        if let token = Credentials.apiToken.get() {
            request.addValue("Bearer \(token)", forHTTPHeaderField:"Authorization")
        }
        request.httpBody = body
        
        return request
    }
}

//
//  PostViewController.swift
//  fakestagram
//
//  Created by LuisE on 9/28/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//

import UIKit

class PostViewController: UIViewController {
    var post: Post? {
        didSet {
            updatePostView()
        }
    }
    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        updatePostView()
        loadComments { comments in
            debugPrint(comments)
        }

        // Do any additional setup after loading the view.
    }

    func updatePostView() {
        guard let post = post else { return }
        post.load { img in
            DispatchQueue.main.async {
                self.imageView.image = img
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func loadComments(successful: @escaping ([Comment]) -> Void) {
        guard let uwrappedPost = post, let postId = uwrappedPost.id else { return }
        let url = URL(string: "https://fakestagram-api.herokuapp.com/api/v1/posts/\(postId)/comments")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "get"
        request.addValue("Bearer f41af9b1-5a7e-4f0b-8c88-e44f686b1d2e", forHTTPHeaderField: "Authorization")

        let task = URLSession.shared.dataTask(with: request) { (data, _, error) in
            if error != nil || data == nil {
                return
            }
            // get status code

            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            do {
                guard let data = data else { print("Empty response"); return }
                let json = try decoder.decode([Comment].self, from: data)
                successful(json)
            } catch let err {
                print("Unable to parse successfull response: \(err.localizedDescription)")
            }
        }
        task.resume()
    }

    func loadLikes(successful: @escaping ([Like]) -> Void) {
        guard let uwrappedPost = post, let postId = uwrappedPost.id else { return }
        let url = URL(string: "https://fakestagram-api.herokuapp.com/api/v1/posts/\(postId)/likes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "get"
        request.addValue("Bearer f41af9b1-5a7e-4f0b-8c88-e44f686b1d2e", forHTTPHeaderField: "Authorization")

        let task = URLSession.shared.dataTask(with: request) { (data, _, error) in
            if error != nil || data == nil {
                return
            }
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            do {
                guard let data = data else { print("Empty response"); return }
                let json = try decoder.decode([Like].self, from: data)
                successful(json)
            } catch let err {
                print("Unable to parse successfull response: \(err.localizedDescription)")
            }
        }
        task.resume()
    }
}

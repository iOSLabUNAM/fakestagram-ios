//
//  PostsTableViewController.swift
//  fakestagram
//
//  Created by LuisE on 9/24/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//

import UIKit

struct Post: Codable {
    let id: Int?
    let title: String
    let imageUrl: String?
    var likesCount: Int
    var commentsCount: Int
    let createdAt: String
    var liked: Bool
    let location: String

    func likesCountText() -> String {
        return "\(likesCount) likes"
    }

    func commentsCountText() -> String {
        return "\(commentsCount) comments"
    }

    func load(_ image: @escaping (UIImage) -> Void) {
        guard let urlString = imageUrl, let url = URL(string: urlString) else { return }
        DispatchQueue.global(qos: .background).async {
            if let data = try? Data(contentsOf: url), let img = UIImage(data: data) {
                DispatchQueue.main.async { image(img) }
            }
        }
    }
}

class PostsTableViewController: UITableViewController {
    static let cellId = "PostCell"
    var posts = [Post]()

    override func viewDidLoad() {
        super.viewDidLoad()
        loadPosts { data in
            DispatchQueue.main.async {
                self.posts = data
                self.tableView.reloadData()
            }
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostsTableViewController.cellId, for: indexPath)
        posts[indexPath.row].load { img in
            cell.imageView?.contentMode = .scaleAspectFit
            cell.imageView?.image = img
        }
        cell.textLabel?.text = posts[indexPath.row].title
        cell.detailTextLabel?.text = posts[indexPath.row].location

        return cell
    }

    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */

    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */

    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */

    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */

    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */

    func loadPosts(successful: @escaping ([Post]) -> Void) {
        var request = URLRequest(url: URL(string: "https://fakestagram-api.herokuapp.com/api/v1/posts")!)
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
                let json = try decoder.decode([Post].self, from: data)
                successful(json)
            } catch let err {
                print("Unable to parse successfull response: \(err.localizedDescription)")
            }
        }
        task.resume()
    }
}

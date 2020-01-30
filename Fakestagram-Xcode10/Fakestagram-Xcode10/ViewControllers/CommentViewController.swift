//
//  CommentViewController.swift
//  Fakestagram-Xcode10
//
//  Created by Pedro Carlos Monzalvo Navarro on 17/12/19.
//  Copyright © 2019 unam. All rights reserved.
//

import UIKit

class CommentViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate{
    var messages: [CommentServiceResponse] = []
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textFieldComment: UITextField!
    private let messagingService = CommentService()
    var postID: String? {
        didSet {
            messagingService.postID = postID ?? ""
        }
    }
    
    @IBAction func sendComment(_ sender: Any?){
        UIView.animate(withDuration: 0.3) {
            self.view.transform = .identity
            self.textFieldComment.endEditing(true)
        }
        messagingService.call(success: { [weak self] response in
            self?.emptyInputField()
            guard let message = response as? CommentServiceResponse else { return }
            self?.messages.append(message)
            self?.updateTable()
        }, withAction: .create, and: textFieldComment.text ?? "")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.textFieldComment.delegate = self
        let nib = UINib(nibName: String(describing: CommentTableViewCell.self), bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: CommentTableViewCell.identifier)
    }
    
    private func emptyInputField(){
        DispatchQueue.main.async {
            self.textFieldComment.text = ""
        }
    }
    
    private func updateTable() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.3) {
            self.view.transform = .init(translationX: 0, y: -300)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CommentTableViewCell.identifier, for: indexPath) as? CommentTableViewCell else { return UITableViewCell() }
        let message = messages[indexPath.row]
        cell.update(withMessage: message)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        UIView.animate(withDuration: 0.3) {
            self.view.transform = .identity
            self.textFieldComment.endEditing(true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    static func get() -> CommentViewController {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "CommentViewController") as! CommentViewController
        return newViewController
    }
}

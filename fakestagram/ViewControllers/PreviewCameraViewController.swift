//
//  PreviewCameraViewController.swift
//  fakestagram
//
//  Created by Ricardo Hernández González on 25/11/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//

import UIKit

class PreviewCameraViewController: UIViewController {

    var cameraVC: CameraViewController!
//    var dato: String!
    var imagen: UIImage!
    @IBOutlet weak var previewImage: UIImageView!
    @IBOutlet weak var textForTitle: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        print("dato: \(dato)")
        previewImage.image = imagen
        
    }
    
    @IBAction func cancel(_ sender: UIButton) {
    }
    
    @IBAction func uploadImage(_ sender: UIButton) {
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

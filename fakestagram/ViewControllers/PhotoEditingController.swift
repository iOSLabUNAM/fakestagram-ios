//
//  PhotoEditingController.swift
//  fakestagram
//
//  Created by Javier Ferrer on 1/17/20.
//  Copyright © 2020 3zcurdia. All rights reserved.
//

import UIKit
import CoreImage
import CoreGraphics


class PhotoEditingViewController : UIViewController, UIScrollViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    @IBOutlet weak var scrollView: UIScrollView!
        
    @IBOutlet weak var titleTextField: UITextField!

    var image_: UIImage!
    var imgview = UIImageView()

    private var originalImage : UIImage?
    
    let service = CreatePostService()

    override func viewDidLoad() {
                
        scrollView.delegate = self
        imgview.frame = CGRect(x: 0, y: 0, width: scrollView.frame.size.width, height: scrollView.frame.size.height)
        imgview.image = UIImage(named: "default");
        imgview.isUserInteractionEnabled = true
        scrollView.addSubview(imgview)

        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(PhotoEditingViewController.loadImage(_:)))
        tapGestureRecognizer.numberOfTouchesRequired = 1
        imgview.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func loadImage(_ sender: UITapGestureRecognizer){
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[.editedImage] as? UIImage {
            imgview.image = image
            originalImage = image
        }else if let image = info[.originalImage] as? UIImage {
            imgview.image = image
            originalImage = image
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func Dismiss(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

    struct Filtro {
        let nombreDeFiltro : String
        var valorFiltro : Any?
        var nombreDeValorDelFiltro: String?

        init(nombreDeFiltro : String, valorFiltro : Any?, nombreDeValorDelFiltro: String?) {
            self.nombreDeFiltro = nombreDeFiltro
            self.nombreDeValorDelFiltro = nombreDeValorDelFiltro
            self.valorFiltro = valorFiltro
        }
    }
    
    private func applyFilter(image : UIImage, filterEffect : Filtro) -> UIImage? {

        guard let cgImage = image.cgImage else { return nil }

        let context = CIContext(options: nil)

        let ciImage = CIImage(cgImage: cgImage)
        let filter = CIFilter(name: filterEffect.nombreDeFiltro)

        filter?.setValue(ciImage, forKey: kCIInputImageKey)

        if let filterEffectValue = filterEffect.valorFiltro, let filterEffectValueName = filterEffect.nombreDeValorDelFiltro {
            filter?.setValue(filterEffectValue, forKey: filterEffectValueName)
        }

        var imagenFiltrada : UIImage?

        if let output = filter?.value(forKey: kCIOutputImageKey) as? CIImage, let cgiImageResult = context.createCGImage(output, from: output.extent){
            imagenFiltrada = UIImage(cgImage: cgiImageResult)
        }
        return imagenFiltrada
    }

    @IBAction func applySepia(_ sender: Any){

        guard let image = imgview.image else { return }

        imgview.image = applyFilter(image: image, filterEffect: Filtro(nombreDeFiltro: "CISepiaTone", valorFiltro: 2.85, nombreDeValorDelFiltro: kCIInputIntensityKey))

    }

    @IBAction func applyPhotoTransferEffect(_ sender: Any){

        guard let image = imgview.image else { return }

        imgview.image = applyFilter(image: image, filterEffect: Filtro(nombreDeFiltro: "CIPhotoEffectProcess", valorFiltro: nil, nombreDeValorDelFiltro: nil))

    }

    @IBAction func applyBlur(_ sender: Any){

        guard let image = imgview.image else { return }

        imgview.image = applyFilter(image: image, filterEffect: Filtro(nombreDeFiltro: "CIGaussianBlur", valorFiltro: 8.0, nombreDeValorDelFiltro: kCIInputRadiusKey))

    }

    @IBAction func applyPhotoEffectNoir(_ sender: Any){

        guard let image = imgview.image else { return }

        imgview.image = applyFilter(image: image, filterEffect: Filtro(nombreDeFiltro: "CIPhotoEffectNoir", valorFiltro: nil, nombreDeValorDelFiltro: nil))
    }

    @IBAction func clearFilters(_ sender: Any){
        imgview.image = originalImage
    }
    
    @IBAction func newPost(_ sender: Any) {
        
        var titulo : String?
        titulo = titleTextField.text
        let isEmpty = (titleTextField.text ?? "").isEmpty
        
        if isEmpty == true {
            let alert = UIAlertController(title: "Title Missing", message: "Please write an image title", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated:  true, completion: nil)
            
        } else {
            
            if let img = imgview.image{
                service.call(image: img, title: titulo!) { postId in
                print("Successful!")
                print(postId ?? -1)
                }
            }
        }
    }
    
}


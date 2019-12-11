//
//  PreviewViewController.swift
//  fakestagram
//
//  Created by Pedro Antonio Vazquez Rodriguez on 10/12/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//

import UIKit
import CoreImage

class PreviewViewController: UIViewController {
    
    var image:UIImage!
    let service = CreatePostService()
       
    let filters = ["CIBumpDistortion"
    ,"CIGaussianBlur"
    ,"CIPixellate"
    ,"CISepiaTone","CITwirlDistortion"
    ,"CIUnsharpMask"
    ,"CIVignette"
    ,"CIPhotoEffectMono"
    ,"CIPhotoEffectChrome"
    ,"CIPhotoEffectFade"
    ,"CIPhotoEffectInstant"
    ,"CIPhotoEffectNoir"
    ,"CIPhotoEffectProcess"
    ,"CIPhotoEffectTonal"
    ,"CIPhotoEffectTransfer"
    ,"CIComicEffect"]
    
    @IBOutlet weak var postImageView: UIImageView!
    
    @IBOutlet weak var postTitleTextField: UITextField!
    
    @IBOutlet weak var filtersCollectionView: UICollectionView!
    //stack Views
    @IBOutlet weak var intensityStackView: UIStackView!
    @IBOutlet weak var radiousStackView: UIStackView!
    @IBOutlet weak var scaleStackView: UIStackView!
    //sliders
    @IBOutlet weak var intensitySlider: UISlider!
    @IBOutlet weak var scaleSlider: UISlider!
    @IBOutlet weak var radiousSlider: UISlider!
    

    var currentImage : UIImage!
    var context :CIContext!
    var currentFilter: CIFilter!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        context = CIContext()
        postImageView.image = image
        currentImage = image
        // Do any additional setup after loading the view.
        intensityStackView.isHidden = true
        radiousStackView.isHidden = true
        scaleStackView.isHidden = true
        
        filtersCollectionView.delegate = self
        filtersCollectionView.dataSource = self
        
        filtersCollectionView.register(UINib(nibName: "FiltersCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: FiltersCollectionViewCell.identifier)
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    func  applyProcessing() {
           let inputKeys = currentFilter.inputKeys
           if inputKeys.contains(kCIInputIntensityKey){
              intensityStackView.isHidden = false
               currentFilter.setValue(intensitySlider.value, forKey: kCIInputIntensityKey)
           }else{
               intensityStackView.isHidden = true
           }
           if inputKeys.contains(kCIInputRadiusKey){
               radiousStackView.isHidden = false
               currentFilter.setValue(radiousSlider.value * 300, forKey: kCIInputRadiusKey)
           }else{
               radiousStackView.isHidden = true
               
           }
           if inputKeys.contains(kCIInputScaleKey){
               scaleStackView.isHidden = false
               currentFilter.setValue(scaleSlider.value * 15, forKey: kCIInputScaleKey)
           }else{
               scaleStackView.isHidden = true
           }
           if inputKeys.contains(kCIInputCenterKey){
               currentFilter.setValue(CIVector(x: currentImage.size.width/2, y: currentImage.size.height/2), forKey: kCIInputCenterKey)
           }
           
           guard let outputImage = currentFilter.outputImage else {return}
           
           
           if let cgImage = context.createCGImage(outputImage, from: outputImage.extent){
               let proceedImage = UIImage(cgImage: cgImage)
               postImageView.image = proceedImage
           }
       }

      @IBAction func scaleChange(_ sender: Any) {
          applyProcessing()
      }
      @IBAction func radiousChange(_ sender: Any) {
          applyProcessing()
      }
      @IBAction func changeIntensity(_ sender: Any) {
          applyProcessing()
      }
    
  
    @IBAction func post(_ sender: Any) {
        guard let img = postImageView.image, let text = postTitleTextField.text else {
            return
        }
        service.call(image: img, title: text) { postId in
            print("Successful!")
            print(postId ?? -1)
        }
    }
    
}

extension PreviewViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        filters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = filtersCollectionView.dequeueReusableCell(withReuseIdentifier: FiltersCollectionViewCell.identifier, for: indexPath) as! FiltersCollectionViewCell
        cell.filterString = filters[indexPath.item]
        cell.image = image
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         return CGSize(width: 150, height: self.view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        intensitySlider.value = 0.5
        radiousSlider.value = 0.5
        scaleSlider.value = 0.5
        currentFilter = CIFilter(name: filters[indexPath.item])
        
        
        let beginImage = CIImage(image: image)
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        applyProcessing()
        
    }
    
    
}

//
//  FiltersCollectionViewCell.swift
//  fakestagram
//
//  Created by Pedro Antonio Vazquez Rodriguez on 10/12/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//

import UIKit

class FiltersCollectionViewCell: UICollectionViewCell {
    static let identifier: String = "FilterCell"

    @IBOutlet weak var previewImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    var currentImage : UIImage!
    var context :CIContext!
    var currentFilter: CIFilter!
    var image: UIImage?{
        didSet{
            guard let img = image else {return}
            currentImage = img
            previewImageView.image = img
            let beginImage = CIImage(image: img)
            currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
            previewProcessing()
            //applyProcessing()
        }
    }
    
    var filterString: String?{
        didSet{
            guard let filter = filterString else {return}
            context = CIContext()
            currentFilter = CIFilter(name: filter)
            print(filter)
            titleLabel.text = filter
//            previewProcessing()
        }
        
    }
    
    
    func  previewProcessing() {
              let inputKeys = currentFilter.inputKeys
              if inputKeys.contains(kCIInputIntensityKey){
                currentFilter.setValue(0.5, forKey: kCIInputIntensityKey)
              }
              if inputKeys.contains(kCIInputRadiusKey){
                 
                currentFilter.setValue(0.5 * 300, forKey: kCIInputRadiusKey)
              }
              if inputKeys.contains(kCIInputScaleKey){
                currentFilter.setValue(0.5 * 15, forKey: kCIInputScaleKey)
              }
              if inputKeys.contains(kCIInputCenterKey){
                  currentFilter.setValue(CIVector(x: currentImage.size.width/2, y: currentImage.size.height/2), forKey: kCIInputCenterKey)
              }
              
              guard let outputImage = currentFilter.outputImage else {return}
              
              
              if let cgImage = context.createCGImage(outputImage, from: outputImage.extent){
                  let proceedImage = UIImage(cgImage: cgImage)
                  previewImageView.image = proceedImage
              }
          }

}




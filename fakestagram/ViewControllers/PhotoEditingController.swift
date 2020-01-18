//
//  PhotoEditingController.swift
//  fakestagram
//
//  Created by Javier Ferrer on 1/17/20.
//  Copyright © 2020 3zcurdia. All rights reserved.
//

import Foundation
import UIKit
import CoreImage

class PhotoEditingViewController : UIViewController {

    @IBOutlet weak var imgview: UIImageView!

  //  var imgview: UIImageView!
    private var originalImage : UIImage?

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

        imgview.image = applyFilter(image: image, filterEffect: Filtro(nombreDeFiltro: "CISepiaTone", valorFiltro: 8.0, nombreDeValorDelFiltro: kCIInputIntensityKey))

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
    
}


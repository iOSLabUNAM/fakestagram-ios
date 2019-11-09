//
//  CameraViewController.swift
//  Fakestagram-Xcode10
//
//  Created by Pedro Carlos Monzalvo Navarro on 19/10/19.
//  Copyright © 2019 unam. All rights reserved.
//

import UIKit
import CoreLocation

class CameraViewController: UIViewController, CLLocationManagerDelegate {

    let locationManager = CLLocationManager()
    let service = CreatePostService()

    override func viewDidLoad() {
        super.viewDidLoad()
        enableBasicLocationServices()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        locationManager.startUpdatingLocation()
    }

    override func viewWillDisappear(_ animated: Bool) {
        locationManager.stopUpdatingLocation()
        super.viewWillDisappear(animated)

    }

    @IBAction func onTapCreate(_ sender: UIButton) {
        let img = UIImage(named: "pomememe")!
        service.call(image: img, title: "Karate Pome") { (postId) in
            print("Successful!")
            print(postId ?? -1)
        }
    }

    func enableBasicLocationServices() {
        locationManager.delegate = self
        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted, .denied:
            print("Disable location features")
        case .authorizedWhenInUse, .authorizedAlways:
            print("Enable location features")
        @unknown default:
            fatalError()
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        print(location)
        service.update(coordinate: location.coordinate)
    }
}

//
//  CameraViewController.swift
//  fakestagram
//
//  Created by LuisE on 10/19/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
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

    @IBAction func onTapCreate(_ sender: Any) {
        let img = UIImage(named: "spacecat")!
        service.call(
          image: img,
          title: "Spacecat🙀 - \(UUID().uuidString)"
        ) { postId in
            print("Successful!")
            print(postId ?? -1)
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

//
//  CameraViewController.swift
//  fakestagram
//
//  Created by LuisE on 10/19/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//

import UIKit
import CoreLocation
import AVFoundation

class CameraViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        enableBasicLocationServices()
        enableCameraAccess()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        locationManager.startUpdatingLocation()
    }

    override func viewWillDisappear(_ animated: Bool) {
        locationManager.stopUpdatingLocation()
        super.viewWillDisappear(animated)
    }

    let service = CreatePostService()
    @IBAction func onTapCreate(_ sender: Any) {
        print("📸")
        let settings: AVCapturePhotoSettings
        print(self.photoOutput.availablePhotoCodecTypes)
        if self.photoOutput.availablePhotoCodecTypes.contains(.hevc) {
            settings = AVCapturePhotoSettings(format:
                [AVVideoCodecKey: AVVideoCodecType.hevc])
        } else {
            settings = AVCapturePhotoSettings()
        }
        settings.flashMode = .auto
        photoOutput.capturePhoto(with: settings, delegate: self)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: - CoreLocation methods
    let locationManager = CLLocationManager()
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

    // MARK: - AVFoundation methods

    @IBOutlet weak var previewView: PreviewView!
    func enableCameraAccess() {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
            case .authorized:
                // The user has previously granted access to the camera.
                self.setupCaptureSession()
            case .notDetermined:
                // The user has not yet been asked for camera access.
                AVCaptureDevice.requestAccess(for: .video) { granted in
                    if granted {
                        self.setupCaptureSession()
                    }
                }
            case .denied:
                // The user has previously denied access.
                return
            case .restricted:
                // The user can't grant access due to restrictions.
                return
        @unknown default:
            fatalError()
        }
    }

    let session = AVCaptureSession()
    let photoOutput = AVCapturePhotoOutput()

    func setupCaptureSession() {
        session.beginConfiguration()
        let device = AVCaptureDevice.default(.builtInDualCamera,
                                                 for: .video, position: .back)!
        guard let videoDeviceInput = try? AVCaptureDeviceInput(device: device),
            session.canAddInput(videoDeviceInput) else { return }
        session.addInput(videoDeviceInput)

        guard session.canAddOutput(photoOutput) else { return }
        session.sessionPreset = .photo
        session.addOutput(photoOutput)

        session.commitConfiguration()
        previewView.session = session

        session.startRunning()
    }

}

extension CameraViewController: AVCapturePhotoCaptureDelegate {
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        debugPrint(photo.metadata)

        guard let data = photo.fileDataRepresentation(), let img = UIImage(data: data) else { return }
        service.call(image: img, title: UUID().uuidString) { postId in
            print("Successful!")
            print(postId ?? -1)
        }
    }
}

extension CameraViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        service.update(coordinate: location.coordinate)
    }
}

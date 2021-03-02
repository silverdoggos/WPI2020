//
//  CameraModel.swift
//  WPI2020
//
//  Created by Artem Shishkin on 02.03.2021.
//

import SwiftUI
import AVFoundation

class CameraModel: NSObject, ObservableObject {
    // MARK: - Published var properties
    @Published var session = AVCaptureSession()
    @Published var isAlertNeeded = false
    @Published var tackenObject = AVCapturePhotoOutput()
    @Published var preview = AVCaptureVideoPreviewLayer()
    
    // MARK: - Action
    func setupCameraModel() {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            setupCamera()
            return
        case .denied:
            self.isAlertNeeded.toggle()
            return
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video, completionHandler: { (status) in
                if status {
                    self.setupCamera()
                }
            })
        default:
            return
        }
    }
    
    private func setupCamera() {
        do {
            session.beginConfiguration()
            
            let optionalDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back)
            
            guard let device = optionalDevice else {
                print("error with device")
                return }
            
            let input = try AVCaptureDeviceInput(device: device)
            
            if self.session.canAddInput(input) {
                self.session.addInput(input)
            }
            self.session.commitConfiguration()
        } catch {
            print(error.localizedDescription)
        }
    }
}

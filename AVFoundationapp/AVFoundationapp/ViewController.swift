//
//  ViewController.swift
//  AVFoundationapp
//
//  Created by trainee on 23/07/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import UIKit
import Photos
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var captureButton: UIButton!
   
    @IBOutlet var captureView: UIView!
    
     @IBOutlet weak var photoModeButton: UIButton!
    
     @IBOutlet weak var toggleCameraButton: UIButton!
    
    @IBOutlet weak var toggleFlashButton: UIButton!
   
    @IBOutlet weak var toggleModeButton: UIButton!
    
    @IBOutlet weak var videoModeButton: UIButton!
   
   
    
let cameraController = CameraController()
    
    @IBAction func toggleFlashButton(_ sender: Any) {
        
        if cameraController.flashMode == .on {
            cameraController.flashMode = .off
            toggleFlashButton.setImage(#imageLiteral(resourceName: "Flash Off Icon"), for: .normal)
        }
            
        else {
            cameraController.flashMode = .on
            toggleFlashButton.setImage(#imageLiteral(resourceName: "Flash On Icon"), for: .normal)
        }
    }
    
    @IBAction func switchCameraButton(_ sender: Any) {
        do {
            try cameraController.switchCameras()
        }
            
        catch {
            print(error)
        }
        
        switch cameraController.currentCameraPosition {
        case .some(.front):
            toggleCameraButton.setImage(#imageLiteral(resourceName: "Front Camera Icon"), for: .normal)
            
        case .some(.rear):
            toggleCameraButton.setImage(#imageLiteral(resourceName: "Rear Camera Icon"), for: .normal)
            
        case .none:
            return
        }
    }
    
    @IBAction func captureButton(_ sender: Any) {
        cameraController.captureImage {(image, error) in
            guard let image = image else {
                print(error ?? "Image capture error")
                return
            }
            
            try? PHPhotoLibrary.shared().performChangesAndWait {
                PHAssetChangeRequest.creationRequestForAsset(from: image)
            }
        }
        
    }
    
    
    override func viewDidLoad() {
        
        func configureCameraController() {
            cameraController.prepare {(error) in
                if let error = error {
                    print(error)
                }
                
                try? self.cameraController.displayPreview(on: self.captureView)
            }
        }
        
        func styleCaptureButton() {
            captureButton.layer.borderColor = UIColor.black.cgColor
            captureButton.layer.borderWidth = 2
            
            captureButton.layer.cornerRadius = min(captureButton.frame.width, captureButton.frame.height) / 2
        }
        
        styleCaptureButton()
        configureCameraController()
        
        }
      //  super.viewDidLoad()
        
    }
    
 



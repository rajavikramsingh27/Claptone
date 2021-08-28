//
//  ClapYourselfViewController.swift
//  Claptone
//
//  Created by Rajat Pathak on 02/07/18.
//  Copyright © 2018 Rajat Pathak. All rights reserved.
//

import UIKit
import Photos
import AVFoundation


class ClapYourselfViewController: UIViewController {

    //    MARK:- IBOutlets
    @IBOutlet weak var cameraModButton: UIButton!
    @IBOutlet weak var capturePreviewView: UIView!
    @IBOutlet weak var captureButton: UIButton!
    @IBOutlet weak var toggleCameraButton: UIButton!
    @IBOutlet weak var libraryCollection: UICollectionView!
    
    @IBOutlet weak var capture_View_Upper: UIView!

    //    MARK:- vars
    var imageArray:Array<UIImage> = []
    let cameraController = CameraController()
    
    
    var session: AVCaptureSession?
    var stillImageOutput: AVCaptureStillImageOutput?
    var videoPreviewLayer: AVCaptureVideoPreviewLayer?
    
    
//    override var prefersStatusBarHidden: Bool { return true }
    
    //    MARK:- VC's life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        styleCaptureButton()
        configureCameraController()
//        grabPhotos()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)

//            session = AVCaptureSession()
//            session!.sessionPreset = AVCaptureSession.Preset.photo
//            let backCamera = AVCaptureDevice.default(for: .video)
//
//            var error: NSError?
//            var input: AVCaptureDeviceInput!
//            do {
//                input = try AVCaptureDeviceInput(device: backCamera!)
//            } catch let error1 as NSError {
//                error = error1
//                input = nil
//                print(error!.localizedDescription)
//            }
//            if error == nil && session!.canAddInput(input) {
//                session!.addInput(input)
//                stillImageOutput = AVCaptureStillImageOutput()
//                stillImageOutput?.outputSettings = [AVVideoCodecKey: AVVideoCodecJPEG]
//
//                if session!.canAddOutput(stillImageOutput!) {
//                    session!.addOutput(stillImageOutput!)
//                    videoPreviewLayer = AVCaptureVideoPreviewLayer(session: session!)
//                    videoPreviewLayer!.videoGravity = AVLayerVideoGravity.resizeAspectFill
//                    videoPreviewLayer!.connection?.videoOrientation = AVCaptureVideoOrientation.portrait
//                    capturePreviewView.layer.addSublayer(videoPreviewLayer!)
//                    session!.startRunning()
//                }
//            }
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        videoPreviewLayer!.frame = capturePreviewView.bounds
    }
    
    
    //    MARK:- Custom functions
    func configureCameraController() {
        cameraController.prepare {(error) in
            if let error = error {
                print(error)
            }
            try? self.cameraController.displayPreview(on: self.capturePreviewView)
        }
    }
    
    func styleCaptureButton() {
        captureButton.layer.borderColor = UIColor.black.cgColor
        captureButton.layer.borderWidth = 2
        
        captureButton.layer.cornerRadius = min(captureButton.frame.width, captureButton.frame.height) / 2
        
        capture_View_Upper.layer.borderColor = UIColor.white.cgColor
        capture_View_Upper.layer.borderWidth = 4
        capture_View_Upper.layer.cornerRadius = capture_View_Upper.frame.size.height/2
        capture_View_Upper.clipsToBounds = true
    }
    
    //    MARK:- IBActions
    @IBAction func switchCameras(_ sender: UIButton) {
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
    
    @IBAction func captureImage(_ sender: UIButton) {
        
        let videoConnection = stillImageOutput!.connection(with: AVMediaType.video)
        if(videoConnection != nil) {
            stillImageOutput?.captureStillImageAsynchronously(from: videoConnection!, completionHandler: { (sampleBuffer, error) -> Void in
                if sampleBuffer != nil {
                    let imageData = AVCaptureStillImageOutput.jpegStillImageNSDataRepresentation(sampleBuffer!)
                    let dataProvider = CGDataProvider(data: imageData as! CFData)
                    let cgImageRef = CGImage.init(jpegDataProviderSource: dataProvider!, decode: nil, shouldInterpolate: true, intent: CGColorRenderingIntent.relativeColorimetric)
                    let image = UIImage(cgImage: cgImageRef!, scale: 1.0, orientation: UIImageOrientation.right)
                    
//                    capturePreviewView.layer.addSublayer()
//
//                    self.capturedImage.image = image
                }
            })
        }
    }

    
//    @IBAction func captureImage(_ sender: UIButton) {
//
//        cameraController.captureImage {(image, error) in
//            guard let image = image else {
//                print(error ?? "Image capture error")
//                return
//            }
//
//            try? PHPhotoLibrary.shared().performChangesAndWait {
//                PHAssetChangeRequest.creationRequestForAsset(from: image)
//            }
//        }
//        //self.grabPhotos()
//        //self.libraryCollection.reloadData()
//    }
    
    @IBAction func cameraMod(_ sender: UIButton) {
        if sender.image(for: .normal) == UIImage(named: "photo-camera"){
            sender.setImage(UIImage(named: "video-camera"), for: .normal)
            captureButton.setImage(UIImage(named: "photo-camera"), for: .normal)
        } else {
            sender.setImage(UIImage(named: "photo-camera"), for: .normal)
             captureButton.setImage(UIImage(named: "video-camera"), for: .normal)
        }
    }
    
}



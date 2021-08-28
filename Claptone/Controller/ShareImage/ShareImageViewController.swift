//
//  ShareImageViewController.swift
//  Claptone
//
//  Created by Rajat Pathak on 02/07/18.
//  Copyright © 2018 Rajat Pathak. All rights reserved.
//

import UIKit

class ShareImageViewController: UIViewController {
    //    MARK:- IBOutlets
    @IBOutlet weak var selectedImage: UIImageView!
    
    //    MARK:- vars
    var image:UIImage!

    
    //    MARK:- VC's life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setImageOnselectedImage()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    MARK:- IBActions
    @IBAction func backButtonAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
//        self.dismiss(animated: true, completion: nil)
    }
    
//    MARK:- Custom functions
    func setImageOnselectedImage()
    {
        selectedImage.image = image
    }
    
    //    MARK:- Finish
}

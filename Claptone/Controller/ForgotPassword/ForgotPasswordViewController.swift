//
//  ForgotPasswordViewController.swift
//  Claptone
//
//  Created by Rajat Pathak on 02/07/18.
//  Copyright © 2018 Rajat Pathak. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: UIViewController {
    
    //    MARK:- IBOutlets
    
    //    MARK:- vars
    
    //    MARK:- VC's life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //    MARK:- IBActions
    @IBAction func btn_Back(_ sender:UIButton)  {
        self.navigationController?.popViewController(animated: true)
    }
    
    //    MARK:- Custom functions
    
    //    MARK:- Finish
}




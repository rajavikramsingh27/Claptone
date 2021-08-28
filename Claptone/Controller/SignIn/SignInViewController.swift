//
//  SignInViewController.swift
//  Claptone
//
//  Created by Rajat Pathak on 02/07/18.
//  Copyright © 2018 Rajat Pathak. All rights reserved.
//

import UIKit
import SVProgressHUD


class SignInViewController: UIViewController {
    //    MARK:- IBOutlets
        @IBOutlet weak var txt_Email:UITextField!
        @IBOutlet weak var txt_PWD:UITextField!
    
    //    MARK:- vars
    
    //    MARK:- VC's life Cycle
    
//    override var preferredStatusBarStyle: UIStatusBarStyle {
//        return .lightContent
//    }
    
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
    
    
    @IBAction func btn_Next(_ sender:UIButton)  {
        
        if !func_Validation() {
            return
        }
        
        func_ShowHud()
        Model_SignIn.shared.str_Email = txt_Email.text!
        Model_SignIn.shared.str_Password = txt_PWD.text!
        
        Model_SignIn.shared.func_API_SignIn { (status) in
            print(status)
            DispatchQueue.main.async {
                self.func_HideHud()
                if status == "0" {
                    self.func_ShowHude_Error(with: Model_SignIn.shared.str_MSG)
                    DispatchQueue.main.asyncAfter(deadline: .now()+0.7, execute: {
                        self.func_HideHud()
                    })
                } else {
                    let tabbar = self.storyboard?.instantiateViewController(withIdentifier: "tabbar")
                    self.navigationController?.pushViewController(tabbar!, animated: true)
                }
            }
        }
    }
    
    //    MARK:- Custom functions
    
    //    MARK:- Finish
}

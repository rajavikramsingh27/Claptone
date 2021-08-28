//
//  Konstant.swift
//  EZYRide-Driver
//
//  Created by Raja Vikram singh on 31/07/18.
//  Copyright © 2018 Raja Vikram singh. All rights reserved.
//

import Foundation
import UIKit
import SVProgressHUD



// MARK:- KONSTANT THINGS
let k_User_Device_Value = "Ios"
let k_Token_Value = "03af688d3c57b62511a98f878e819184"


// MARK:- BASE URL

let k_BASEURL = "https://appentus.me/claptone/api/api/"

// MARK:- REST URLS
// MARK:- REGISTRATION
let k_REGISTRATION = "user_reg/"
let k_LOGIN = "user_login"
let k_GetShow = "get_show"


//MARK:- PARAMETERS

// MARK:- REGISTRATION

let p_User_Name = "user_name"
let p_User_Email = "user_email"
let p_User_Password = "user_password"
let p_User_Device = "user_device"
let p_User_Token = "_token"



// MARK:- RESPONSE PARAMETERS KEY

let response_Status = "status"
let response_Success = "success"
let response_MSG = "msg"
let response_Message = "message"
let response_Result = "result"



extension UIViewController {
    
    func func_ShowHud()  {
        SVProgressHUD .show()
        self.view .isUserInteractionEnabled = false
    }
    
    func func_HideHud()  {
        SVProgressHUD .dismiss()
        self.view.isUserInteractionEnabled = true
    }
    
    func func_ShowHude_Success(with success_MSG:String) {
        SVProgressHUD.showSuccess(withStatus: success_MSG)
        self.view.isUserInteractionEnabled = true
    }
    
    
    func func_ShowHude_Error(with success_MSG:String) {
        SVProgressHUD.showError(withStatus: success_MSG)
        self.view.isUserInteractionEnabled = true
    }
    
    func func_IsValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
     var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}


//
//  Extension-Registration.swift
//  Claptone
//
//  Created by Raja Vikram singh on 03/09/18.
//  Copyright © 2018 Rajat Pathak. All rights reserved.
//

import Foundation
import UIKit
import SVProgressHUD


extension RegistrationViewController {
    func func_Validation() -> Bool {
        
        if txt_Name.text!.isEmpty {
            func_ShowHude_Error(with: "Enter name")
            
            DispatchQueue.main.asyncAfter(deadline: .now()+0.7) {
                self.func_HideHud()
            }
            return false
        } else if txt_Email.text!.isEmpty {
            func_ShowHude_Error(with: "Enter email")
            
            DispatchQueue.main.asyncAfter(deadline: .now()+0.7) {
                self.func_HideHud()
            }
            return false
        }
        
        let isEmail = func_IsValidEmail(testStr: txt_Email.text!)
        
        if !isEmail {
            func_ShowHude_Error(with: "Enter valid email")
            DispatchQueue.main.asyncAfter(deadline: .now()+0.7) {
                self.func_HideHud()
            }
            return false
        } else if txt_Password.text!.isEmpty {
            func_ShowHude_Error(with: "Enter password")
            
            DispatchQueue.main.asyncAfter(deadline: .now()+0.7) {
                self.func_HideHud()
            }
            return false
        } else if txt_ConfirmPassword.text!.isEmpty {
            func_ShowHude_Error(with: "Enter confirm password")
            
            DispatchQueue.main.asyncAfter(deadline: .now()+0.7) {
                self.func_HideHud()
            }
            return false
        } else if txt_Password.text != txt_ConfirmPassword.text {
            func_ShowHude_Error(with: "Enter same password and confirm password")
            
            DispatchQueue.main.asyncAfter(deadline: .now()+0.7) {
                self.func_HideHud()
            }
            return false
        } else {
            return true
        }
    }
}





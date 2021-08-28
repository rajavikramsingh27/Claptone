//
//  Extension-SignIn.swift
//  Claptone
//
//  Created by Raja Vikram singh on 03/09/18.
//  Copyright © 2018 Rajat Pathak. All rights reserved.
//

import Foundation
import UIKit
import SVProgressHUD


extension SignInViewController {
    func func_Validation() -> Bool {
        
       if txt_Email.text!.isEmpty {
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
        } else if txt_PWD.text!.isEmpty {
            func_ShowHude_Error(with: "Enter password")
            
            DispatchQueue.main.asyncAfter(deadline: .now()+0.7) {
                self.func_HideHud()
            }
            return false
        } else {
            return true
        }
    }
}

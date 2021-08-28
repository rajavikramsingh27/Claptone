//
//  Model-Registration.swift
//  Claptone
//
//  Created by Raja Vikram singh on 03/09/18.
//  Copyright © 2018 Rajat Pathak. All rights reserved.
//

import Foundation

class Model_Registration {
    
    static let shared = Model_Registration()
    
    var str_Email = ""
    var str_Name = ""
    var str_Password = ""
    
    var str_MSG = ""
    
    func func_API_Registration(completionHandler:@escaping (String)->()) {
        let strURL = k_BASEURL+k_REGISTRATION
        print(strURL)
        let params = "\(p_User_Token)=\(k_Token_Value)&\(p_User_Device)=\(k_User_Device_Value)&\(p_User_Name)=\(str_Name)&\(p_User_Email)=\(str_Email)&\(p_User_Password)=\(str_Password)"
        print(params)
        
        API_Claptone.func_API_Call_POST(str_URL:strURL, param: params) { (dictJSON) in
            print(dictJSON)
            if dictJSON[response_Status] as! String == response_Success {
                
            } else {
                self.str_MSG = dictJSON[response_MSG] as! String
            }
            completionHandler(dictJSON[response_Status] as! String)
        }

    }
}

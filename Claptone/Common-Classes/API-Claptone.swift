//
//  API-Claptone.swift
//  Claptone
//
//  Created by Raja Vikram singh on 03/09/18.
//  Copyright © 2018 Rajat Pathak. All rights reserved.
//

import Foundation

class API_Claptone {
    
    
    class func func_API_Call_POST(str_URL:String,param:String,completionHandler:@escaping ([String:Any])->()) {
        let url = URL(string: str_URL)!
        
        print("url is:-",url)
        print("param is:-",param)
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.addValue("text/html; charset=UTF-8", forHTTPHeaderField: "Content-Type")
//        let jsonData = try? JSONSerialization.data(withJSONObject: param)
        
        request.httpBody =  param.data(using: .utf8)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            do {
                let json =  try JSONSerialization .jsonObject(with:data!
                    , options: .allowFragments)
                print("json is:-",json)
                
                completionHandler(json as! [String:Any])
            }
            catch let error as NSError {
                print("error is:-",error)
                completionHandler(["success":false])
            }
        }
        task.resume()
    }
    
    
    
    //    MARK:- apiCall_GET
   class func apiCall_GET(ApiName:String,completionHandler:@escaping ([String:Any])->())
    {
        let request = NSMutableURLRequest (url: URL (string: ApiName)!)
        let session = URLSession.shared
        request.httpMethod = "GET"
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        session.dataTask(with: request as URLRequest, completionHandler:
            {
                (data, response, error) in
                print("error:-",error ?? "error nil")
                
                if error == nil
                {
                    do
                    {
                        let jsonData = try JSONSerialization.jsonObject(with: data!, options: .allowFragments)
                        print("json data is:- \(jsonData)")
                        
                        completionHandler(jsonData as! [String:Any])
                    }
                    catch
                    {
                        print("Error info: \(error)")
                        completionHandler(["success":false])
                    }
                }
                else
                {
                    completionHandler(["success":false])
                }
        }).resume()
    }
    
    
}

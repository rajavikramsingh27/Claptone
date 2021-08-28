
//  Model-ShowVC.swift
//  Claptone
//  Created by Raja Vikram singh on 03/09/18.
//  Copyright © 2018 Rajat Pathak. All rights reserved.


import Foundation
import Foundation

class Model_Shows {
    
    static let shared = Model_Shows()
    
    var str_Show_Title = ""
    var str_Show_Date = ""
    var str_Show_Day = ""
    var str_Show_Location = ""

    var str_MSG = ""
    
    var arr_Get_All_Shows = [[String:Any]]()
    
    
    
    func func_API_Shows_List(completionHandler:@escaping (String)->()) {
        let strURL = k_BASEURL+k_GetShow
        print(strURL)
        
        API_Claptone.apiCall_GET(ApiName: strURL) { (dictJSON) in
            print(dictJSON)
//            if Bool("\(dictJSON[response_Status]!)")! {
                self.arr_Get_All_Shows = [[String:Any]]()
                
                for dict_ShowList in (dictJSON[response_Result] as? [[String:Any]])! {
                    print(dict_ShowList)
                    self.arr_Get_All_Shows.append(dict_ShowList)
                }
                
//            } else {
//                self.str_MSG = dictJSON[response_MSG] as! String
//            }
            completionHandler(dictJSON[response_Status] as! String)
        }
        
    }
    
    
//    self.arr_History = [[NSMutableArray alloc]init];
//    for(NSDictionary *dic in [response objectForKey:@"data"])
//    {
//            [self.arr_History addObject:[self func_SetHistory:dic]];
//    }
    
    func func_Shows_List(dict_ShowList:[String:Any]) -> Model_Shows {
        let modelShows = Model_Shows()
        print(dict_ShowList)
        
        modelShows.str_Show_Title = dict_ShowList["show_title"] as! String
        modelShows.str_Show_Date = dict_ShowList["show_date"] as! String
        modelShows.str_Show_Day = dict_ShowList["show_day"] as! String
        modelShows.str_Show_Location = dict_ShowList["show_location"] as! String
        modelShows.str_Show_Title = dict_ShowList["show_title"] as! String
        
        return modelShows
    }
    
    
//    -(ModelHistory*) func_SetHistory:(NSDictionary *)dic
//    {
//    ModelHistory *modelHistory = [[ModelHistory alloc]init];
//
//    NSString *str_Image = [dic objectForKey:@"profile"];
//    self.urlImage =[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",baseUrl,str_Image]];
//    self.str_Name = [NSString stringWithFormat:@"%@",[dic objectForKey:@"name"]];
//    self.str_BookDate = [NSString stringWithFormat:@"%@",[dic objectForKey:@"book_date"]];
//
//    NSString *str_DateTime = [NSString stringWithFormat:@"%@",[dic objectForKey:@"date_time"]];
//    NSLog(@"str_DateTime is:- %@",str_DateTime);
//
//    NSArray *arr_DateTime = [str_DateTime componentsSeparatedByString:@" "];
//    NSLog(@"arr_DateTime is:- %@",arr_DateTime);
//
//    if (arr_DateTime.count) {
//    self.str_Date = [NSString stringWithFormat:@"%@",arr_DateTime[0]];
//    self.str_Time = [NSString stringWithFormat:@"%@ AM",arr_DateTime[1]];
//    }
//
//    return modelHistory;
//    }

    
    
    
    
    
    
}

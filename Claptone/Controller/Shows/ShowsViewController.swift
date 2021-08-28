//
//  ShowsViewController.swift
//  Claptone
//
//  Created by Rajat Pathak on 02/07/18.
//  Copyright © 2018 Rajat Pathak. All rights reserved.
//

import UIKit

class ShowsViewController: UIViewController {
    //    MARK:- IBOutlets
        @IBOutlet weak var tbl_ShowList:UICollectionView!

    //    MARK:- vars
    
    //    MARK:- VC's life Cycle
    
//    override var preferredStatusBarStyle: UIStatusBarStyle {
//        return .lightContent
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.title = "CLAPTONE"
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        func_ShowHud()
        Model_Shows.shared.func_API_Shows_List { (status) in
            print(status)
            DispatchQueue.main.async {
                self.func_HideHud()
                self.tbl_ShowList.reloadData()
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //    MARK:- IBActions
    
    //    MARK:- Custom functions
    
    //    MARK:- Finish
}

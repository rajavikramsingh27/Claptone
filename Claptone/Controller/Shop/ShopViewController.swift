//
//  ShopViewController.swift
//  Claptone
//
//  Created by Rajat Pathak on 02/07/18.
//  Copyright © 2018 Rajat Pathak. All rights reserved.
//"https://www.claptone.bigcartel.com/"

import UIKit
class ShopViewController: UIViewController {

    @IBOutlet weak var shopWebView: UIWebView!
    @IBOutlet weak var top_LayoutTitle: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadWebView(url:"https://claptone.bigcartel.com/" )
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        print(self.view.frame.size.height)
        //if self.view.frame.size.height == 729 {
         //   top_LayoutTitle.constant = 34
       // } else {
         //   top_LayoutTitle.constant = 0
       // }
    }
    
    func loadWebView(url:String)
    {
        let url = NSURL(string: url)
        let request =  NSURLRequest(url: url! as URL)
      //  shopWebView.load(request as URLRequest)
        shopWebView.loadRequest(request as URLRequest)
    }
}

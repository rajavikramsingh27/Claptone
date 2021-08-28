//
//  MusicViewController.swift
//  Claptone
//
//  Created by Rajat Pathak on 02/07/18.
//  Copyright © 2018 Rajat Pathak. All rights reserved.
//

import UIKit

class MusicViewController: UIViewController {

    
    let imageArray:Array<String> = ["9","10"]
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    
    @IBAction func btn_SpotifyMusic(_ sender:UIButton) {
        if let url = URL(string: "app://"),UIApplication.shared.canOpenURL(url as URL) {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(url)
            }
        } else {
            let url  = URL(string: "https://www.spotify.com/int/why-not-available/".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url!, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(url!)
            }
        }
    }
    
   @IBAction func btn_AppleMusic(_ sender:UIButton) {
    
        let url  = URL(string: "music://".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url!, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url!)
        }
    
    }
    
}


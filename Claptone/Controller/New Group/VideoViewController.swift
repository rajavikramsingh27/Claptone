//
//  VideoViewController.swift
//  Claptone
//
//  Created by Rajat Pathak on 03/07/18.
//  Copyright © 2018 Rajat Pathak. All rights reserved.
//
// google api key = "AIzaSyCbZMB4t4JNmxcjswMxz5P2Snnb7Z0BUOo"
//google youtube playlist url = https://www.googleapis.com/youtube/v3/playlists?part=snippet%2CcontentDetails&channelId=UC7ZRAt7eWXsmanQ3x4EWmZw&maxResults=25&key=AIzaSyCbZMB4t4JNmxcjswMxz5P2Snnb7Z0BUOo


import UIKit
import Alamofire
import AlamofireImage


class VideoViewController: UIViewController {
    
    @IBOutlet weak var youtubePlaylist: UITableView!
    
    @IBOutlet weak var youtubePlayer: YTPlayerView!
    @IBOutlet weak var chanelText: UILabel!
    
    var items:NSArray = []
    var videoTitle:NSArray = []
    var videoId:NSArray = []
    var thumbnails:NSArray = []
    var high:NSArray = []
    var url:NSArray = []
    var snippet:NSArray = []
    var headerView:HeaderView!
    var id:NSArray = []
    var channelTitle:NSArray = []
    
    
    var str_VideoId = ""
    var str_ChannelName = ""
    var playerVars:NSDictionary!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//            func_ShowHud()
            self.alamofireRequest()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        youtubePlayer.delegate = self
    }
    
}


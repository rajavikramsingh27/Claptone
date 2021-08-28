//
//  Extension-Video.swift
//  Claptone
//
//  Created by Raja Vikram singh on 07/08/18.
//  Copyright © 2018 Rajat Pathak. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SVProgressHUD

extension VideoViewController:UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        if indexPath.row == 0 {
//            return 300
//        } else {
            return 127
//        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videoTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        if indexPath.row == 0 {
//            let cell_YouTubePlayer = tableView.dequeueReusableCell(withIdentifier: "cell_YouTubePlayer", for: indexPath) as! YouTube_TableViewCell
//
//            cell_YouTubePlayer.youtubePlayer.backgroundColor = UIColor .clear
//            cell_YouTubePlayer.youtubePlayer.load(withVideoId: str_VideoId, playerVars: playerVars as? [AnyHashable : Any])
//            cell_YouTubePlayer.chanelText.text = str_ChannelName
//
//            return cell_YouTubePlayer
//        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! VideoTableViewCell
            
            let imageUrl = URL(string: self.url[indexPath.row] as! String)
            cell.videoImage.af_setImage(withURL: imageUrl!)
            cell.videoTitle.text = self.videoTitle[indexPath.row] as? String
            
            let bgColorView = UIView()
            bgColorView.backgroundColor = UIColor.clear
            bgColorView.layer.cornerRadius = 4
            bgColorView.layer.borderColor = UIColor.init(red: 165/225.0, green: 147/225.0, blue: 42/225.0, alpha: 1).cgColor
            bgColorView.layer.borderWidth = 1
            cell.selectedBackgroundView = bgColorView
            
            return cell
//        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        playerVars = ["playsinline": 1,"modestbranding":0,"showinfo":0]
        
//        if indexPath.row > 0 {
            str_VideoId = self.videoId[indexPath.row] as! String
            str_ChannelName = self.videoTitle[indexPath.row] as! String
        
            youtubePlayer.load(withVideoId: str_VideoId, playerVars: playerVars as? [AnyHashable : Any])
            chanelText.text = str_ChannelName
            youtubePlayer.playVideo()
//        }
//        let indexPath = IndexPath (row: 0, section: 0)
//        tableView.reloadRows(at: [indexPath], with:.none)
    }
}


extension VideoViewController: YTPlayerViewDelegate {
    func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
        youtubePlayer.playVideo()
    }
}

extension VideoViewController {
    func alamofireRequest()
    {
        let youtubeURL:String = "https://www.googleapis.com/youtube/v3/search?key=AIzaSyCbZMB4t4JNmxcjswMxz5P2Snnb7Z0BUOo&channelId=UC7ZRAt7eWXsmanQ3x4EWmZw&part=snippet,id&order=date&maxResults=50"
        
        SVProgressHUD .show()
        self.view .isUserInteractionEnabled = false
        
        Alamofire.request(youtubeURL).responseJSON { response in
            
            if let json = response.result.value {
                print("Json is:-",json)
                
                self.items = (json as! NSObject).value(forKey: "items") as! NSArray
                self.snippet = self.items.value(forKey: "snippet") as! NSArray
                self.channelTitle = self.snippet.value(forKey: "channelTitle") as! NSArray
                self.videoTitle = self.snippet.value(forKey: "title") as! NSArray
                self.id = self.items.value(forKey: "id") as! NSArray
                self.videoId = self.id.value(forKey: "videoId") as! NSArray
                self.thumbnails = self.snippet.value(forKey: "thumbnails") as! NSArray
                self.high = self.thumbnails.value(forKey: "high") as! NSArray
                self.url = self.high.value(forKey: "url") as! NSArray
                
                self.str_VideoId = self.videoId[0] as! String
                self.str_ChannelName = self.videoTitle[0] as! String
                
                self.youtubePlayer.load(withVideoId:self.str_VideoId, playerVars:self.playerVars as? [AnyHashable : Any])
                self.chanelText.text = self.str_ChannelName
                self.youtubePlayer.playVideo()
                self.youtubePlaylist.reloadData()
                
                SVProgressHUD .dismiss()
                self.view .isUserInteractionEnabled = true
            }
        }
    }
    
}




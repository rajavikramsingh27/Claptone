//
//  YouTube_TableViewCell.swift
//  Claptone
//
//  Created by Raja Vikram singh on 06/08/18.
//  Copyright © 2018 Rajat Pathak. All rights reserved.
//

import UIKit

class YouTube_TableViewCell: UITableViewCell {
    
    @IBOutlet weak var youtubePlayer: YTPlayerView!
    @IBOutlet weak var chanelText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

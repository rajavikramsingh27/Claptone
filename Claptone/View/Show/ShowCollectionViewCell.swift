//
//  ShowCollectionViewCell.swift
//  Claptone
//
//  Created by Rajat Pathak on 02/07/18.
//  Copyright © 2018 Rajat Pathak. All rights reserved.
//

import UIKit

class ShowCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var lbl_Show_Title:UILabel!
    @IBOutlet weak var lbl_Show_Date:UILabel!
    @IBOutlet weak var lbl_Show_Day:UILabel!
    @IBOutlet weak var lbl_Show_Location:UILabel!
    
    
    override func awakeFromNib() {
        self.cellStyle()
    }
    
    func cellStyle()
    {
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.init(red: 165/225.0, green: 147/225.0, blue: 42/225.0, alpha: 1).cgColor
        self.layer.masksToBounds = false
        self.layer.cornerRadius = 10
    }
    
}

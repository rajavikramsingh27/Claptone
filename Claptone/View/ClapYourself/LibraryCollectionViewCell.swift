//
//  LibraryCollectionViewCell.swift
//  Claptone
//
//  Created by Rajat Pathak on 02/07/18.
//  Copyright © 2018 Rajat Pathak. All rights reserved.
//

import UIKit

class LibraryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    override func awakeFromNib() {
        self.cellStyle()
    }
    
    func cellStyle()
    {
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.masksToBounds = false
        self.layer.cornerRadius = 5
    }
}

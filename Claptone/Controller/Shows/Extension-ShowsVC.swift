//
//  Extension-ShowsVC.swift
//  Claptone
//
//  Created by Raja Vikram singh on 03/09/18.
//  Copyright © 2018 Rajat Pathak. All rights reserved.
//

import Foundation
import UIKit


extension ShowsViewController:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Model_Shows.shared.arr_Get_All_Shows.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ShowCollectionViewCell
        
        cell.lbl_Show_Date.text = Model_Shows.shared.arr_Get_All_Shows[indexPath.row]["show_date"] as? String
        cell.lbl_Show_Day.text = Model_Shows.shared.arr_Get_All_Shows[indexPath.row]["show_day"] as? String
        cell.lbl_Show_Title.text = Model_Shows.shared.arr_Get_All_Shows[indexPath.row]["show_title"] as? String
        cell.lbl_Show_Location.text = Model_Shows.shared.arr_Get_All_Shows[indexPath.row]["show_location"] as? String

        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: 144)
        
    }
    
}


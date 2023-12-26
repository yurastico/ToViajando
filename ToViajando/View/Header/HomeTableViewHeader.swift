//
//  HomeTableViewHeader.swift
//  ToViajando
//
//  Created by Yuri Cunha on 21/12/23.
//

import UIKit

class HomeTableViewHeader: UIView {

    @IBOutlet weak var titleLabelView: UILabel!
    
    @IBOutlet weak var bannerImageView: UIImageView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var bannerView: UIView!
    
    @IBOutlet weak var bannerHeaderView: UIView!
    
    func configureView() {
        headerView.backgroundColor = UIColor(red: 30.0/255.0,green: 59.0/255.0,blue: 119.0/255,alpha: 1)
        bannerHeaderView.layer.cornerRadius = 10
        bannerHeaderView.layer.masksToBounds = true
        
        headerView.layer.cornerRadius = 500
        headerView.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMaxYCorner]
        
    }
    
}

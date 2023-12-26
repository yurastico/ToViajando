//
//  TripTableViewCell.swift
//  ToViajando
//
//  Created by Yuri Cunha on 26/12/23.
//

import UIKit

class TripTableViewCell: UITableViewCell {


 
    @IBOutlet weak var backgroundViewCell: UIView!
    
    @IBOutlet weak var tripImage: UIImageView!
    
    @IBOutlet weak var titleTripLabel: UILabel!
    @IBOutlet weak var subtitleTripLabel: UILabel!
    @IBOutlet weak var diaryTripLabel: UILabel!
    
    
    @IBOutlet weak var priceDiscontLabl: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var cancellationStatusLabel: UILabel!
}

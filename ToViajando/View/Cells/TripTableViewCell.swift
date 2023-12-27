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
    
    
    func configCell(_ trip: Viagem?) {
        tripImage.image = UIImage(named: trip?.asset ?? "")
        titleTripLabel.text = trip?.titulo
        subtitleTripLabel.text = trip?.subtitulo
        priceLabel.text = "R$ \(trip?.preco ?? 0)"
        let atributtedString = NSMutableAttributedString(string: "R$ \(trip?.precoSemDesconto ?? 0)")
        atributtedString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: NSMakeRange(0,atributtedString.length))
        priceDiscontLabl.attributedText = atributtedString
        
        if let numberOfDays = trip?.diaria, let numberOfGuests = trip?.hospedes {
            let days = numberOfDays == 1 ? "Diaria" : "Diarias"
            let guests = numberOfGuests == 1 ? "Pessos" : "Pessoas"
            diaryTripLabel.text = "\(numberOfDays) \(days) - \(numberOfGuests) \(guests)"
        }
        
    }
}

//
//  OfferTableViewCell.swift
//  ToViajando
//
//  Created by Yuri Cunha on 28/12/23.
//

import UIKit

class OfferTableViewCell: UITableViewCell {

    @IBOutlet var tripViews: [UIView]!
    @IBOutlet var tripImages: [UIImageView]!
    @IBOutlet var tripTitleLabels: [UILabel]!
    @IBOutlet var tripSubtitleLabels: [UILabel]!
    @IBOutlet var tripPriceLabels: [UILabel]!
    @IBOutlet var priceDiscontLabels: [UILabel]!
    
    func configCell(_ trips: [Viagem]?) {
        guard let trips else { return }
        
        for i in 0..<trips.count {
            setOutlets(i,trip: trips[i])
        }
        tripViews.forEach { view in
            view.addSombra()
        }
        
        
    }
    
    private func setOutlets(_ index: Int, trip: Viagem) {
        let imageOutlet = tripImages[index]
        imageOutlet.image = UIImage(named: trip.asset)
        
        let titleOutlet = tripTitleLabels[index]
        titleOutlet.text = trip.titulo
        
        let subtitleoOutlet = tripSubtitleLabels[index]
        subtitleoOutlet.text = trip.subtitulo
        
        let priceOutlet = tripPriceLabels[index]
        priceOutlet.text = "A partir de R$ \(trip.precoSemDesconto)"
        
        let tripDiscount = priceDiscontLabels[index]
        tripDiscount.text = "R$ \(trip.preco)"
        
        
    }
    
}

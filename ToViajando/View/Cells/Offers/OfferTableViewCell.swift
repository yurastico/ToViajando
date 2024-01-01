//
//  OfferTableViewCell.swift
//  ToViajando
//
//  Created by Yuri Cunha on 28/12/23.
//

import UIKit

protocol OfferTableViewCellDelegate: AnyObject {
    func didSelectView(_ trip: Viagem?)
}

class OfferTableViewCell: UITableViewCell {

    @IBOutlet var tripViews: [UIView]!
    @IBOutlet var tripImages: [UIImageView]!
    @IBOutlet var tripTitleLabels: [UILabel]!
    @IBOutlet var tripSubtitleLabels: [UILabel]!
    @IBOutlet var tripPriceLabels: [UILabel]!
    @IBOutlet var priceDiscontLabels: [UILabel]!
    
    
    
    private var trips: [Viagem]?
    weak var delegate: OfferTableViewCellDelegate?
    
    func configCell(_ trips: [Viagem]?) {
        self.trips = trips
        guard let trips else { return }
        
        for i in 0..<trips.count {
            setOutlets(i,trip: trips[i])
        }
        tripViews.forEach { view in
            view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didSelectedView)))
            view.addSombra()
        }
        
        
    }
    
    @objc private func didSelectedView(_ gesture: UIGestureRecognizer) {
        guard let view = gesture.view else { return }
        let selectedTrip = trips?[view.tag]
        delegate?.didSelectView(selectedTrip)
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

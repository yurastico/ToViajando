//
//  TripOfferViewModel.swift
//  ToViajando
//
//  Created by Yuri Cunha on 28/12/23.
//

import Foundation

final class TripOfferViewModel: ViagemViewModel {
    var sessionTitle: String {
        "Oferta"
    }
    
    var type: ViagemViewModelType {
        .ofertas
    }
    
    var trips: [Viagem]
    
    var numberOfLines: Int {
        return trips.count
    }
    init(_ trips: [Viagem]) {
        self.trips = trips
    }
    
    
}

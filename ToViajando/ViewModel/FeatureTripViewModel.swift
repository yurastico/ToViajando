//
//  FeatureTripViewModel.swift
//  ToViajando
//
//  Created by Yuri Cunha on 26/12/23.
//

import Foundation

final class ViagemDestaqueViewModel: ViagemViewModel {
    var sessionTitle: String {
        "Destaques"
    }
    
    var type: ViagemViewModelType {
        .destaques
    }
    
    var trips: [Viagem]
    
    var numberOfLines: Int {
        trips.count
    }
    init(_ trips: [Viagem]) {
        self.trips = trips
    }
    
    
}

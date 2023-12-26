//
//  TripViewModel.swift
//  ToViajando
//
//  Created by Yuri Cunha on 26/12/23.
//

import Foundation

enum ViagemViewModelType: String {
    case destaques
    case ofertas
    case internacional
}

protocol ViagemViewModel {
    var sessionTitle: String { get }
    var type: ViagemViewModelType { get }
    var trips: [Viagem] { get set}
    var numberOfLines: Int { get }
}

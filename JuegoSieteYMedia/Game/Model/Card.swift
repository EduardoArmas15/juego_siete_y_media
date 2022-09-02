//
//  Card.swift
//  JuegoSieteYMedia
//
//  Created by Eduardo Armas Garcia on 31/08/22.
//

import Foundation

class Card {
    var value: Int
    var cardType: CardType
    
    init?(_ value: Int, _ cardType: CardType) {
        if (value == 8) || (value == 9) || (value < 0) || (value > 12) {
            return nil
        }
        self.value = value
        self.cardType = cardType
    }
    
    func descripcion() -> String {
        "\(value) of \(cardType.rawValue)"
    }
}

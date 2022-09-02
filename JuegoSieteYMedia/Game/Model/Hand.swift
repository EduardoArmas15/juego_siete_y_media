//
//  Hand.swift
//  JuegoSieteYMedia
//
//  Created by Eduardo Armas Garcia on 31/08/22.
//

import Foundation

class Hand {
    var cards: [Card]
    var size: Int {
        cards.count
    }
    init() {
        self.cards = []
    }
    
    func addCard(_ card: Card) {
        self.cards.append(card)
    }
    
    func getCard(position: Int) -> Card?{
        if position >= 0 || position >= self.size{
            return self.cards[position]
        }else {
            return nil
        }
    }
}

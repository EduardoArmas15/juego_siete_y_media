//
//  Deck.swift
//  JuegoSieteYMedia
//
//  Created by Eduardo Armas Garcia on 31/08/22.
//

import Foundation

class Deck {
    var cards: [Card]
    init() {
        self.cards = []
        fillDeck()
        
    }
    func fillDeck() {
        for index in 1...12 {
            if let card = Card(index, .bastos) {
                self.cards.append(card)
            }
            if let card = Card(index, .espadas) {
                self.cards.append(card)
            }
            if let card = Card(index, .copas) {
                self.cards.append(card)
            }
            if let card = Card(index, .oros) {
                self.cards.append(card)
            }
        }
        self.shuffle()
    }
    
    func dealCard() -> Card? {
        return self.cards.popLast()
    }
    
    func shuffle() {
        self.cards.shuffle()
    }
    
    func testDealingACard() {
        // Verify all cards
        for num in 0..<cards.count {
            print(self.cards[num].descripcion())
        }
        print("/////////////////////////////////////////")
        self.dealCard()
        // Verify if card was removed
        for num in 0..<cards.count {
            print(self.cards[num].descripcion())
        }
    }
    
}

//
//  Game.swift
//  JuegoSieteYMedia
//
//  Created by Eduardo Armas Garcia on 31/08/22.
//

import Foundation

class Game {
    var deck: Deck?
    var playerHand: Hand?
    var status: GameStatus
    var machineScore: Double = 0.0
    var playerScore: Double = 0.0
    var lastPlayerCard: Card?

    init() {
        self.status = .NotStarted
    }

    // When start game button is pressed
    func start() {
        self.deck = Deck()
        self.deck!.shuffle()
        self.playerHand = Hand()
        self.playerAsksForACard()
    }

    // When user pressed Ask for a Card button
    func playerAsksForACard() {
        self.status = .PlayerTurn
        if let dealtCard = self.deck?.dealCard() {
            print("You got \(dealtCard.descripcion())")
            self.playerHand?.addCard(dealtCard)
            self.addPlayerPoints()
            print("You have \(self.playerScore) points")
            if (self.playerScore > 7.5) {
                finish()
            }
        }
    }
    
    // When its turn of the machine. Get a random number no grater than 7.5
    func machineGetTurn() {
        self.status = .MachineTurn
        machineScore = Double(Int.random(in: 1...7))
        if (Bool.random()) {
            machineScore += 0.5
        }
        print("Score of machine: \(machineScore)")
        finish()
    }

    func addPlayerPoints() {
        self.playerScore = 0
        for num in 0..<(playerHand?.size ?? 0) {
            if let card = playerHand?.getCard(position:num) {
                playerScore += card.value > 9 ? 0.5:Double(card.value)
            }
        }
    }
    
    // When user decides to stand
    func playerStands() {
        machineGetTurn()
    }

    // Calculations when game is finished
    private func finish() {
        self.addPlayerPoints()
        print("Player score: \(playerScore)")
        print("Machine score: \(machineScore)")
        
        if playerScore > 7.5 || machineScore > playerScore {
            self.status = .PlayerLost
            print("Player Lost!!")
        } else if machineScore == playerScore {
            self.status = .Tie
            print("It's a Tie!!")
        } else {
            self.status = .PlayerWon
            print("Player Won!!")
        }
    }
}

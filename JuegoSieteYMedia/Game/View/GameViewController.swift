//
//  GameViewController.swift
//  JuegoSieteYMedia
//
//  Created by Eduardo Armas Garcia on 31/08/22.
//

import UIKit

class GameViewController: UIViewController {
    let game = Game()
    @IBOutlet weak var askForACardButton: UIButton!
    @IBOutlet weak var standButton: UIButton!
    @IBOutlet weak var newGameButton: UIButton!
    
    var newGameButtonShouldBeEnabled: Bool {
        (game.status == .NotStarted) || (game.status == .PlayerLost) || (game.status == .PlayerWon) || (game.status == .Tie )
    }
    var askForACardButtonShouldBeEnabled: Bool {
        game.status != .NotStarted && game.status != .PlayerWon && game.status != .PlayerLost && game.status != .Tie
    }
    var standButtonShouldBeEnabled: Bool {
        game.status == .PlayerTurn
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    func configureUI() {
        self.view.backgroundColor = .systemGreen
        askForACardButton.addTarget(self, action: #selector(userAsksForACard), for: .touchUpInside)
        standButton.addTarget(self, action: #selector(userStands), for: .touchUpInside)
        newGameButton.addTarget(self, action: #selector(startNewGame), for: .touchUpInside)
        self.verifyButtonsEnablement()
    }
    
    @objc func userAsksForACard(sender: UIButton!) {
        print("User asked for a card")
        self.game.playerAsksForACard()
        self.displayPlayerTurnInfo()
        self.verifyStatusOfGame()
    }
    
    @objc func userStands(sender: UIButton!) {
        print("User decided to stand")
        self.game.playerStands()
        self.displayMachineTurnInfo()
        self.verifyStatusOfGame()
    }
    
    @objc func startNewGame(sender: UIButton!) {
        print("Start new game pressed")
        self.game.start()
        self.displayPlayerTurnInfo()
    }
    
    func verifyButtonsEnablement() {
        newGameButton.isEnabled = newGameButtonShouldBeEnabled
        askForACardButton.isEnabled = askForACardButtonShouldBeEnabled
        standButton.isEnabled = standButtonShouldBeEnabled
    }
    
    func displayPlayerTurnInfo() {
        let numberOfCardsInHand = (self.game.playerHand?.size)! - 1
        let message = "You got \(self.game.playerHand!.cards[numberOfCardsInHand].descripcion()).\n\n Total points:  \(self.game.playerScore) "
        MessageAlert.showMessageWithAction(title: "Card dealt!",
                                           message: message,
                                           viewController: self,
                                           onOk: {(alert: UIAlertAction!) in self.verifyStatusOfGame()})
    }
    
    func displayMachineTurnInfo() {
        let message = "\nMachine got \(self.game.machineScore) points."
        MessageAlert.showMessageWithAction(title: "Machine turn finished!",
                                           message: message, viewController: self,
                                           onOk: { (alert: UIAlertAction!) in self.verifyStatusOfGame()})
    }
    
    func verifyStatusOfGame() {
        if game.status == .PlayerWon || game.status == .PlayerLost || game.status == .Tie{
            let message = game.status == .PlayerWon ? "\nPlayer Won!! :)": (game.status == .PlayerLost ? "\nPlayer Lost!! :(":"\nIt's a Tie!!")
            MessageAlert.show(title:"Game Finished!",
                              message: message,
                              viewController: self)
        }
        self.verifyButtonsEnablement()
    }
    
    func testAddingCardsToHand() {
        let hand = Hand()
        hand.addCard(Card(1, .oros)!)
        hand.addCard(Card(10, .espadas)!)
        hand.addCard(Card(7, .copas)!)
        print("Hay \(hand.size) cartas")
        for num in 0..<hand.size {
            if let card = hand.getCard(position:num) {
                print(card.descripcion())
            }
        }
    }
}


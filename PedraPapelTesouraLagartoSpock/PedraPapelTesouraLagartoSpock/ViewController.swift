//
//  ViewController.swift
//  PedraPapelTesouraLagartoSpock
//
//  Created by Luciano Berchon on 25/02/22.
//

import UIKit

class ViewController: UIViewController {
    // MARK: Outlets
    @IBOutlet weak var signLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    @IBOutlet weak var lizardButton: UIButton!
    @IBOutlet weak var spockButton: UIButton!
    
    @IBOutlet weak var playAgainButton: UIButton!
    
    // MARK: Actions
    @IBAction func rockChosen(_ sender: Any) {
        play(userSign: .rock)
    }
    
    @IBAction func paperChosen(_ sender: Any) {
        play(userSign: .paper)
    }
    
    @IBAction func scissorsChosen(_ sender: Any) {
        play(userSign: .scissors)
    }
    
    @IBAction func lizardChosen(_ sender: Any) {
        play(userSign: .lizard)
    }
    
    @IBAction func spockChosen(_ sender: Any) {
        play(userSign: .spock)
    }
    
    @IBAction func playAgain(_ sender: Any) {
        updateUI(forState: .start)
    }
    
    // MARK: Methods
    func updateUI(forState state: GameState) {
        statusLabel.text = state.status
        
        switch state {
        case .start:
            view.backgroundColor = .gray
            
            signLabel.text = "🤖"
            playAgainButton.isHidden = true
            
            changeHiddenGameButtons(isHidden: false)
        case .win:
            view.backgroundColor = UIColor(red: 0.651, green: 0.792, blue: 0.651, alpha: 1)
        case .lose:
            view.backgroundColor = UIColor(red: 0.851, green: 0.424, blue: 0.412, alpha: 1)
        case .draw:
            view.backgroundColor = UIColor(red: 0.663, green: 0.663, blue: 0.663, alpha: 1)
        }
    }
    
    func play(userSign: Sign) {
        let computerSign = randomSign()
        
        let gameState = userSign.gameState(against: computerSign)
        updateUI(forState: gameState)
        
        signLabel.text = "Seu adversário escolheu \(computerSign.emoji)" // userSign.emoji
        
        changeHiddenGameButtons(isHidden: true)
        
        switch userSign {
        case .rock:
            rockButton.isHidden = false
        case .paper:
            paperButton.isHidden = false
        case .scissors:
            scissorsButton.isHidden = false
        case .lizard:
            lizardButton.isHidden = false
        case .spock:
            spockButton.isHidden = false
        }
        
        playAgainButton.isHidden = false
    }
    
    func changeHiddenGameButtons(isHidden status: Bool) {
        rockButton.isEnabled = !status
        paperButton.isEnabled = !status
        scissorsButton.isEnabled = !status
        lizardButton.isEnabled = !status
        spockButton.isEnabled = !status
        
        rockButton.isHidden = status
        paperButton.isHidden = status
        scissorsButton.isHidden = status
        lizardButton.isHidden = status
        spockButton.isHidden = status
    }
    
    // MARK: Cycle life methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI(forState: .start)
    }


}


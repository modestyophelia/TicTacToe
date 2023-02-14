//
//  ViewController.swift
//  TicTacToe
//
//  Created by Ophelia Aguilar on 2022-09-08.
//

import UIKit

class ViewController: UIViewController {

    var game: Game?
    @IBOutlet weak var btnPlaysAgain: UIButton!
    @IBOutlet var btnCollection: [UIButton]!
    
    @IBOutlet weak var lblResult: UILabel!
    
    @IBAction func buttonAction(_ sender: UIButton) {
        
        if let game = game {
            
           let result = game.addMove(position: sender.tag)
            
            if result == game.GAME_ENDED {
                return
            }
           
            if game.previousPlayer == 0 {
                return
            }

            sender.setImage(UIImage(named: "\(game.previousPlayer).png"), for: .normal)
            
            
            if result == game.GAME_CONTINUE {
                return
            }
            
            switch result {
            case game.RESULT_DRAW:
                lblResult.text = "IT's A DRAW"
            case game.RESULT_PLAYER1:
                lblResult.text = "Player \(game.player1) has won!"
            case game.RESULT_PLAYER2:
                lblResult.text = "Player \(game.player2) has won!"
            case game.GAME_ENDED:
                lblResult.text = "Game has already ended!"
            default: lblResult.text = "Error!"
            }
            
            lblResult.isHidden = false
            btnPlaysAgain.isHidden = false
            
        }
        
    }
    
    

    @IBAction func btnPlayAgain(_ sender: UIButton) {
        game = Game(player1: 1, player2: 2)
        lblResult.isHidden = true
        btnPlaysAgain.isHidden = true
        
        for button in btnCollection {
            button.setImage(UIImage(), for: UIControl.State())
        
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblResult.isHidden = true
        btnPlaysAgain.isHidden = true
        game = Game(player1: 1, player2: 2)
    }


}


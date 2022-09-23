//
//  ViewController.swift
//  TicTacToe
//
//  Created by Ophelia Aguilar on 2022-09-08.
//

import UIKit

class ViewController: UIViewController {

    var playing = 1 // O
    var board = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    var gameIsRunning = true
    let gameContinue = 0
    

    @IBOutlet var btnCollection: [UIButton]!
    
    @IBOutlet weak var lblResult: UILabel!
    
    @IBAction func buttonAction(_ sender: UIButton) {
        
        if (board[sender.tag] == 0  && gameIsRunning == true) {
            
            board[sender.tag] = playing
            
            
        if (playing == 1)
        {
            sender.setImage(UIImage(named: "O.png"), for: .normal)
            playing = 2
        }
        else
        {
            sender.setImage(UIImage(named: "X.png"), for: .normal)
            playing = 1
        }
        }
        
        var result = checkWin()
        
        if result != gameContinue {
            
            lblResult.isHidden = false
            btnPlaysAgain.isHidden = false
            
            print("The winner is player \(result)")
            lblResult.text = "PLAYER \(result) HAS WON"
        }
        
        // Check if its a draw
        var count = 0 //at 9 every cell is filled
        
        for i in board {
            if i != 0 {
                count += 1
                
                if count > 8 && result != 1 && result != 2 {
                    
                    lblResult.isHidden = false
                    btnPlaysAgain.isHidden = false
                    
                    print("ITS A DRAW")
                    lblResult.text = "IT'S A DRAW"
                }
            }
        }
        
    }
    
    
    @IBOutlet weak var btnPlaysAgain: UIButton!
    @IBAction func btnPlayAgain(_ sender: UIButton) {
        board = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        gameIsRunning = true
        playing = 1
        lblResult.isHidden = true
        btnPlaysAgain.isHidden = true
        
        for button in btnCollection {
            button.setImage(UIImage(), for: UIControl.State())
        
        }
    }
    
    
    func checkWin() -> Int {
        
        // Row 1
        if board[0] == board[1] && board[0] == board[2] && board[0] != 0 {
            
            return board[0]
        }
        
        // Row 2
        if board[3] == board[4] && board[3] == board[5] && board[3] != 0 {
            
            return board[3]
        }
        
        // Row 3
        if board[6] == board[7] && board[6] == board[8] && board[6] != 0 {
            
            return board[6]
        }
        
        // Column 1
        if board[0] == board[3] && board[0] == board[6] && board[0] != 0 {
            
            return board[0]
        }
        
        // Column 2
        if board[1] == board[4] && board[1] == board[7] && board[1] != 0 {
            
            return board[1]
        }
        
        // Column 3
        if board[2] == board[5] && board[2] == board[8] && board[2] != 0 {
            
            return board[2]
        }
        
        // Diagonal 1
        if board[0] == board[4] && board[0] == board[8] && board[0] != 0 {
            
            return board[0]
        }
        
        // Diagonal 2
        if board[2] == board[4] && board[2] == board[6] && board[2] != 0 {
            
            return board[2]
        }
        
        return gameContinue
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblResult.isHidden = true
        btnPlaysAgain.isHidden = true
    }


}


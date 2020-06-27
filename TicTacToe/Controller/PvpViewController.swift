//
//  PvpViewController.swift
//  TicTacToe
//
//  Created by Kaique Alves on 24/06/20.
//  Copyright © 2020 Kaique Alves. All rights reserved.
//

import UIKit

class PvpViewController: UIViewController {
    @IBOutlet weak var blackView: UIView!
    @IBOutlet weak var btnGotIt: UIButton!
    @IBOutlet weak var gameImage: UIImageView!
    @IBOutlet weak var choseView: UIView!
    @IBOutlet weak var finishGameView: UIView!
    
    @IBOutlet weak var lbDrawWinner: UILabel!
    @IBOutlet weak var lbScore: UIView!
    
    
    //Player
    var player: String?
    
    //Game
    var game: Game?
    
    //Buttons outlets
    @IBOutlet weak var but0: UIButton!
    @IBOutlet weak var but1: UIButton!
    @IBOutlet weak var but2: UIButton!
    @IBOutlet weak var but3: UIButton!
    @IBOutlet weak var but4: UIButton!
    @IBOutlet weak var but5: UIButton!
    @IBOutlet weak var but6: UIButton!
    @IBOutlet weak var but7: UIButton!
    @IBOutlet weak var but8: UIButton!
    
    
    override func viewWillAppear(_ animated: Bool) {
        blackView.isHidden = false
        btnGotIt.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    //function to make blackView hide with animation and choseView come with animation
    @IBAction func gotIt(_ sender: Any) {
       UIView.animate(withDuration: 0.3, animations: {
             self.blackView.alpha = 0
        }, completion:  {
           (value: Bool) in
               self.blackView.isHidden = true
        })
        
        choseView.alpha = 0
        choseView.isHidden = false
        UIView.animate(withDuration: 0.7, animations: {
             self.choseView.alpha = 1
        }, completion:  nil)
    }
    
    
    
    //Functions that first player chose
    //0 is to represent O and 1 to represent X
    @IBAction func choseO(_ sender: Any) {
        player = "O"
        UIView.animate(withDuration: 0.3, animations: {
             self.choseView.alpha = 0
        }, completion:  {
           (value: Bool) in
               self.choseView.isHidden = true
        })
        startGame(player: player!)
    }
    
    @IBAction func choseX(_ sender: Any) {
        player = "X"
        UIView.animate(withDuration: 0.3, animations: {
             self.choseView.alpha = 0
        }, completion:  {
           (value: Bool) in
               self.choseView.isHidden = true
        })
        startGame(player: player!)
    }
    
    
    //function to instantiate Game class to start the game
    func startGame(player: String){
        game = Game(player: self.player!)
    }
    
    
    
    //Functions of click in the game
    //pstn1 and pstn2 (position) represents the numbers os button in a matrix
    @IBAction func btn0(_ sender: Any) {
        insertInBoard(btn: but0, pstn1: 0, pstn2: 0)
    }
    
    @IBAction func btn1(_ sender: Any) {
        insertInBoard(btn: but1, pstn1: 0, pstn2: 1)
    }
    
    @IBAction func btn2(_ sender: Any) {
        insertInBoard(btn: but2, pstn1: 0, pstn2: 2)
    }
    
    @IBAction func btn3(_ sender: Any) {
        insertInBoard(btn: but3, pstn1: 1, pstn2: 0)
    }
    
    @IBAction func btn4(_ sender: Any) {
        insertInBoard(btn: but4, pstn1: 1, pstn2: 1)
    }
    
    @IBAction func btn5(_ sender: Any) {
        insertInBoard(btn: but5, pstn1: 1, pstn2: 2)
    }
    
    @IBAction func btn6(_ sender: Any) {
        insertInBoard(btn: but6, pstn1: 2, pstn2: 0)
    }
    
    @IBAction func btn7(_ sender: Any) {
        insertInBoard(btn: but7, pstn1: 2, pstn2: 1)
    }
    
    @IBAction func btn8(_ sender: Any) {
        insertInBoard(btn: but8, pstn1: 2, pstn2: 2)
    }
    
    
    func insertInBoard(btn: UIButton, pstn1: Int, pstn2: Int){
         //pstn1 and pstn2 (position) represents the numbers os button in a matrix
        if (game?.canMakePlay(pst1: pstn1, pst2: pstn2) == true){
            btn.setTitle(player, for: .normal)
            player = game?.invertPlayer(player: player!)
        }
        else{
            showAlertMessage(title: "Jogada inválida", message: "Essa posição já está ocupada. \nEscolha outra posição!")
        }
        
        //If game have a draw, the finish screen will appear
        if(game?.draw() == true){
            lbDrawWinner.text = "Deu velha!!!"
            finishGameView.alpha = 0
            finishGameView.isHidden = false
            UIView.animate(withDuration: 0.7, animations: {
                 self.finishGameView.alpha = 1
            }, completion:  nil)
        }
    }
    

    @IBAction func playAgain(_ sender: Any) {
        reset()
        
        choseView.alpha = 0
        choseView.isHidden = false
        UIView.animate(withDuration: 0.7, animations: {
             self.choseView.alpha = 1
        }, completion:  nil)
        
        UIView.animate(withDuration: 0.3, animations: {
             self.finishGameView.alpha = 0
        }, completion:  {
           (value: Bool) in
               self.finishGameView.isHidden = true
        })
    }
    
    @IBAction func goToMenu(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    func reset()->Void{
        but0.setTitle(nil, for: .normal)
        but1.setTitle(nil, for: .normal)
        but2.setTitle(nil, for: .normal)
        but3.setTitle(nil, for: .normal)
        but4.setTitle(nil, for: .normal)
        but5.setTitle(nil, for: .normal)
        but6.setTitle(nil, for: .normal)
        but7.setTitle(nil, for: .normal)
        but8.setTitle(nil, for: .normal)
    }
    
    
    
    
    func showAlertMessage(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
             let ok = UIAlertAction(title: "Certo!", style: .default, handler: { action in
             })
             alert.addAction(ok)
             DispatchQueue.main.async(execute: {
                self.present(alert, animated: true)
        })
    }
    
}

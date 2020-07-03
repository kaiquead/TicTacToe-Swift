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
    @IBOutlet weak var lbScore: UILabel!
    
    
    //Player
    var player: String?
    var player1Choice: String?
    
    //Game
    var game: Game?
    
    //Score
    private var scoreO = 0
    private var scoreX = 0
    private var scorePlayer1 = 0
    private var scorePlayer2 = 0
    
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
        loadScoreGame()
    }
    

    //function to make blackView hide with animation and choseView come with animation
    @IBAction func gotIt(_ sender: Any) {
        
        animateViewOut(view: blackView)
        animateViewIn(view: choseView)
    }
    
    
    
    //Functions that first player chose
    //0 is to represent O and 1 to represent X
    @IBAction func choseO(_ sender: Any) {
        self.player = "O"
        player1Choice = "O"
        animateViewOut(view: choseView)
        startGame(player: player!)
    }
    
    @IBAction func choseX(_ sender: Any) {
        self.player = "X"
        player1Choice = "X"
        animateViewOut(view: choseView)
        startGame(player: player!)
    }
    
    
    //function to instantiate Game class to start the game
    func startGame(player: String){
        game = Game(player: self.player!)
    }
    
    
    
    //Functions of click in the game
    //pstn1 and pstn2 (position) represents the numbers os button in a matrix
    @IBAction func btn0(_ sender: Any) {
        insertInBoard(btn: but0, pstn1: 0, pstn2: 0, player: self.player!)
    }
    
    @IBAction func btn1(_ sender: Any) {
        insertInBoard(btn: but1, pstn1: 0, pstn2: 1, player: self.player!)
    }
    
    @IBAction func btn2(_ sender: Any) {
        insertInBoard(btn: but2, pstn1: 0, pstn2: 2, player: self.player!)
    }
    
    @IBAction func btn3(_ sender: Any) {
        insertInBoard(btn: but3, pstn1: 1, pstn2: 0, player: self.player!)
    }
    
    @IBAction func btn4(_ sender: Any) {
        insertInBoard(btn: but4, pstn1: 1, pstn2: 1, player: self.player!)
    }
    
    @IBAction func btn5(_ sender: Any) {
        insertInBoard(btn: but5, pstn1: 1, pstn2: 2, player: self.player!)
    }
    
    @IBAction func btn6(_ sender: Any) {
        insertInBoard(btn: but6, pstn1: 2, pstn2: 0, player: self.player!)
    }
    
    @IBAction func btn7(_ sender: Any) {
        insertInBoard(btn: but7, pstn1: 2, pstn2: 1, player: self.player!)
    }
    
    @IBAction func btn8(_ sender: Any) {
        insertInBoard(btn: but8, pstn1: 2, pstn2: 2, player: self.player!)
    }
    
    
    //function to insert the move in the board (PVP)
    func insertInBoard(btn: UIButton, pstn1: Int, pstn2: Int, player: String){
         //pstn1 and pstn2 (position) represents the numbers os button in a matrix
        if (game?.canMakePlay(pst1: pstn1, pst2: pstn2) == true){
            btn.setTitle(self.player, for: .normal)
            self.player = game?.invertPlayer(player: self.player!)
        }
        else{
            showAlertMessage(title: "Jogada inválida", message: "Essa posição já está ocupada. \nEscolha outra posição!")
            return
        }
        
        //check if have winner
        //Victory with O
        if(game?.checkVitory()==0 && player == self.player1Choice){
            print("Jogador 1 venceu")
            scorePlayer1+=1
            loadScoreGame()
            lbDrawWinner.text = "Vitória do jogador 1: O"
            animateViewIn(view: finishGameView)
            return
        }
        else if(game?.checkVitory()==0 && player != self.player1Choice){
            print("Jogador 2 venceu")
            scorePlayer2+=1
            loadScoreGame()
            lbDrawWinner.text = "Vitória do jogador 2: O"
            animateViewIn(view: finishGameView)
            return
        }
            
        //victory with X
        else if(game?.checkVitory()==1 && player == self.player1Choice){
            print("Jogador 1 venceu")
            scorePlayer1+=1
            loadScoreGame()
            lbDrawWinner.text = "Vitória do jogador 1: X"
            animateViewIn(view: finishGameView)
            return
        }
        
        else if(game?.checkVitory()==1 && player != self.player1Choice){
            print("Jogador 2 venceu")
            scorePlayer2+=1
            loadScoreGame()
            lbDrawWinner.text = "Vitória do jogador 2: X"
            animateViewIn(view: finishGameView)
            return
        }
        
        //If game have a draw, the finish screen will appear
        if(game?.draw() == true){
            print("Deu velha")
            lbDrawWinner.text = "Deu velha!!!"
            loadScoreGame()
            animateViewIn(view: finishGameView)
        }
    }
    

    @IBAction func playAgain(_ sender: Any) {
        reset()
        animateViewIn(view: choseView)
        animateViewOut(view: finishGameView)
    }
    
    @IBAction func goToMenu(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    func loadScoreGame(){
        lbScore.text = "Score\n Player 1: \(self.scorePlayer1)      Player 2: \(self.scorePlayer2)"
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
    
    func animateViewIn(view: UIView){
        view.alpha = 0
        view.isHidden = false
        UIView.animate(withDuration: 0.7, animations: {
            view.alpha = 1
        }, completion:  nil)
    }
    
    func animateViewOut(view: UIView){
        UIView.animate(withDuration: 0.3, animations: {
             view.alpha = 0
        }, completion:  {
           (value: Bool) in
               view.isHidden = true
        })
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

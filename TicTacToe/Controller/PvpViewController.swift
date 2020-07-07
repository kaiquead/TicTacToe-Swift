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
    @IBOutlet weak var gameView: UIView!
    
    @IBOutlet weak var lbDrawWinner: UILabel!
    @IBOutlet weak var lbScore: UILabel!
    
    //turn
    @IBOutlet weak var playerTurn: UILabel!
    
    
    //Player
    var player: String?
    var player1Choice: String?
    
    //Game
    var game: Game?
    
    //Score
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
        navigationController?.setNavigationBarHidden(false, animated: true)
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
        self.playerTurn.isHidden = false
        playerTurn.text = "Vez: Jogador I"
        startGame(player: player!)
    }
    
    @IBAction func choseX(_ sender: Any) {
        self.player = "X"
        player1Choice = "X"
        animateViewOut(view: choseView)
        self.playerTurn.isHidden = false
        playerTurn.text = "Vez: Jogador I"
        startGame(player: player!)
    }
    
    
    //function to instantiate Game class to start the game
    func startGame(player: String){
        game = Game(player: self.player!)
        self.gameView.isUserInteractionEnabled = true
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
            if(self.player == self.player1Choice){
                self.playerTurn.text = "Vez: Jogador I"
            }
            else{
                self.playerTurn.text = "Vez: Jogador II"
            }
        }
        else{
            showAlertMessage(title: "Jogada inválida", message: "Essa posição já está ocupada. \nEscolha outra posição!")
            return
        }
        
        //check if have winner
        //Victory with O
        if(game?.checkVitory()==0 && player == self.player1Choice){
            self.playerTurn.text = "Temos um vencedor!"
            print("Jogador 1 venceu")
            scorePlayer1+=1
            loadScoreGame()
            lbDrawWinner.text = "Vitória do jogador 1: O"
            paintWinnerMoves()
            return
        }
        else if(game?.checkVitory()==0 && player != self.player1Choice){
            self.playerTurn.text = "Temos um vencedor!"
            print("Jogador 2 venceu")
            scorePlayer2+=1
            loadScoreGame()
            lbDrawWinner.text = "Vitória do jogador 2: O"
            paintWinnerMoves()
            return
        }
            
        //victory with X
        else if(game?.checkVitory()==1 && player == self.player1Choice){
            self.playerTurn.text = "Temos um vencedor!"
            print("Jogador 1 venceu")
            scorePlayer1+=1
            loadScoreGame()
            lbDrawWinner.text = "Vitória do jogador 1: X"
            paintWinnerMoves()
            return
        }
        
        else if(game?.checkVitory()==1 && player != self.player1Choice){
            self.playerTurn.text = "Temos um vencedor!"
            print("Jogador 2 venceu")
            scorePlayer2+=1
            loadScoreGame()
            lbDrawWinner.text = "Vitória do jogador 2: X"
            paintWinnerMoves()
            return
        }
        
        //If game have a draw, the finish screen will appear
        if(game?.draw() == true){
            self.playerTurn.text = "Temos um empate!"
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
        lbScore.text = "Score\n Jogador I:  \(self.scorePlayer1)      Jogador II:  \(self.scorePlayer2)"
    }
    
    func reset()->Void{
        but0.setTitle(nil, for: .normal)
        but0.setTitleColor(.blue, for: .normal)
        
        but1.setTitle(nil, for: .normal)
        but1.setTitleColor(.blue, for: .normal)
        
        but2.setTitle(nil, for: .normal)
        but2.setTitleColor(.blue, for: .normal)
        
        but3.setTitle(nil, for: .normal)
        but3.setTitleColor(.blue, for: .normal)
        
        but4.setTitle(nil, for: .normal)
        but4.setTitleColor(.blue, for: .normal)
        
        but5.setTitle(nil, for: .normal)
        but5.setTitleColor(.blue, for: .normal)
        
        but6.setTitle(nil, for: .normal)
        but6.setTitleColor(.blue, for: .normal)
        
        but7.setTitle(nil, for: .normal)
        but7.setTitleColor(.blue, for: .normal)
        
        but8.setTitle(nil, for: .normal)
        but8.setTitleColor(.blue, for: .normal)
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
    
    //Whem have winner, this function will be called to paint the winner moves
    func paintWinnerMoves(){
        self.gameView.isUserInteractionEnabled = false
        
        let result: [String] = (game?.getWinnerParams())!
        print("result na controler: \(result)")
        
        switch result {
        case result where result == ["0", "1", "2"]:
            timerToPaintTextButton(btn: but0)
            timerToPaintTextButton1(btn: but1)
            timerToPaintTextButton2(btn: but2)
            timerToShowFinishView(view: finishGameView)
            
        case result where result == ["3", "4", "5"]:
            timerToPaintTextButton(btn: but3)
            timerToPaintTextButton1(btn: but4)
            timerToPaintTextButton2(btn: but5)
            timerToShowFinishView(view: finishGameView)
            
        case result where result == ["6", "7", "8"]:
            timerToPaintTextButton(btn: but6)
            timerToPaintTextButton1(btn: but7)
            timerToPaintTextButton2(btn: but8)
            timerToShowFinishView(view: finishGameView)
            
        case result where result == ["0", "3", "6"]:
            timerToPaintTextButton(btn: but0)
            timerToPaintTextButton1(btn: but3)
            timerToPaintTextButton2(btn: but6)
            timerToShowFinishView(view: finishGameView)
            
        case result where result == ["1", "4", "7"]:
            timerToPaintTextButton(btn: but1)
            timerToPaintTextButton1(btn: but4)
            timerToPaintTextButton2(btn: but7)
            timerToShowFinishView(view: finishGameView)
            
        case result where result == ["2", "5", "8"]:
            timerToPaintTextButton(btn: but2)
            timerToPaintTextButton1(btn: but5)
            timerToPaintTextButton2(btn: but8)
            timerToShowFinishView(view: finishGameView)
            
        case result where result == ["0", "4", "8"]:
            timerToPaintTextButton(btn: but0)
            timerToPaintTextButton1(btn: but4)
            timerToPaintTextButton2(btn: but8)
            timerToShowFinishView(view: finishGameView)
            
        default:
            timerToPaintTextButton(btn: but2)
            timerToPaintTextButton1(btn: but4)
            timerToPaintTextButton2(btn: but6)
            timerToShowFinishView(view: finishGameView)
        }
    }
    
    func timerToPaintTextButton(btn: UIButton){
        _ = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { (timer) in
                btn.setTitleColor(.green, for: .normal)
        }
    }
    
    func timerToPaintTextButton1(btn: UIButton){
        _ = Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { (timer) in
                btn.setTitleColor(.green, for: .normal)
        }
    }
    
    func timerToPaintTextButton2(btn: UIButton){
        _ = Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false) { (timer) in
                btn.setTitleColor(.green, for: .normal)
        }
    }
    
    func timerToShowFinishView(view: UIView){
        _ = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { (timer) in
            self.animateViewIn(view: self.finishGameView)
        }
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

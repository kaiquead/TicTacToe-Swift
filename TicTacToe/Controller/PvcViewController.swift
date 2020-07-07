//
//  PvpViewController.swift
//  TicTacToe
//
//  Created by Kaique Alves on 24/06/20.
//  Copyright © 2020 Kaique Alves. All rights reserved.
//

import UIKit

class PvcViewController: UIViewController {
    
    //views
    @IBOutlet weak var finishGameView: UIView!
    @IBOutlet weak var gameView: UIView!
    @IBOutlet weak var blackView: UIView!
    @IBOutlet weak var choseView: UIView!
    
    //outlet buttons
    @IBOutlet weak var but0: UIButton!
    @IBOutlet weak var but1: UIButton!
    @IBOutlet weak var but2: UIButton!
    @IBOutlet weak var but3: UIButton!
    @IBOutlet weak var but4: UIButton!
    @IBOutlet weak var but5: UIButton!
    @IBOutlet weak var but6: UIButton!
    @IBOutlet weak var but7: UIButton!
    @IBOutlet weak var but8: UIButton!
    
    //score
    @IBOutlet weak var lbScore: UILabel!
    //var scoreO: Int = 0
    //var scoreX: Int = 0
    var scoreComputer: Int = 0
    var scorePlayer: Int = 0
    
    //victory or draw label
    @IBOutlet weak var lbDrawWinner: UILabel!
    
    
    //player
    var player:String?
    var playerChoice: String? //used to know whet is the choice of human player
    
    //player turn
    @IBOutlet weak var playerTurn: UILabel!
    
    
    //game
    var game:Game?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        blackView.isHidden = false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
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
    
    //function to insert the move in the board (PVC)
    //pstn1 and pstn2 (position) represents the numbers of button in a matrix
    func insertInBoard(btn: UIButton, pstn1: Int, pstn2: Int, player: String){
        //if is computer turn
        if(player != playerChoice){
            let positions = game?.canMakePlayAleatory()
            insertComputerPosition(position: positions!)
            self.player = game?.invertPlayer(player: self.player!)
            if(self.player == self.playerChoice){
                self.playerTurn.text = "Vez: Jogador"
            }
            else{
                self.playerTurn.text = "Vez: Computador"
            }
        }
        //if is player turn
        else if (game?.canMakePlay(pst1: pstn1, pst2: pstn2) == true){
            btn.setTitle(player, for: .normal)
            self.player = game?.invertPlayer(player: self.player!)
            if(self.player == self.playerChoice){
                self.playerTurn.text = "Vez: Jogador"
            }
            else{
                self.playerTurn.text = "Vez: Computador"
            }
        }
        else{
            showAlertMessage(title: "Jogada inválida", message: "Essa posição já está sendo ocupada. \nEscolha outra posição!")
            return
        }
        
        //check if have winner
        if(game?.checkVitory()==0){
            //if computer win
            if(player != playerChoice){
                self.playerTurn.text = "Temos um vencedor!"
                print("Computador venceu")
                self.scoreComputer+=1
                loadScoreGame()
                lbDrawWinner.text = "Vitória do computador"
                //animateViewIn(view: finishGameView)
                paintWinnerMoves()
                return
            }else{
                self.playerTurn.text = "Temos um vencedor!"
                print("Jogador venceu")
                self.scorePlayer+=1
                loadScoreGame()
                lbDrawWinner.text = "Vitória do jogador"
                //animateViewIn(view: finishGameView)
                paintWinnerMoves()
            return}
        }
        else if(game?.checkVitory()==1){
            if(player != playerChoice){
                self.playerTurn.text = "Temos um vencedor!"
                print("Computador venceu")
                self.scoreComputer+=1
                loadScoreGame()
                lbDrawWinner.text = "Vitória do computador"
                //animateViewIn(view: finishGameView)
                paintWinnerMoves()
                return
            }else{
                self.playerTurn.text = "Temos um vencedor!"
                print("Jogador venceu")
                self.scorePlayer+=1
                loadScoreGame()
                lbDrawWinner.text = "Vitória do jogador"
                //animateViewIn(view: finishGameView)
                paintWinnerMoves()
            return}
        }
        
        //If game have a draw, the finish screen will appear
        if(game?.draw() == true){
            self.playerTurn.text = "Temos um empate!"
            print("Deu velha")
            lbDrawWinner.text = "Deu velha!!!"
            loadScoreGame()
            animateViewIn(view: finishGameView)
            return
        }
        
        //After made my move, the function will be called again to make the computer move after 0.6 seconds of delay
        if(player == playerChoice){
            let _ = Timer.scheduledTimer(withTimeInterval: 0.6, repeats: false) { (timer) in
                self.insertInBoard(btn: btn, pstn1: pstn1, pstn2: pstn2, player: self.player!)
            }
        }
    }
    
    
    
    @IBAction func btnGotIt(_ sender: Any) {
        animateViewOut(view: blackView)
        animateViewIn(view: choseView)
    }
    
    @IBAction func btnChoseO(_ sender: Any) {
        self.player = "O"
        self.playerChoice = "O"
        animateViewOut(view: choseView)
        self.playerTurn.isHidden = false
        self.playerTurn.text = "Vez: Jogador"
        startGame()
    }
    
    @IBAction func btnChoseX(_ sender: Any) {
        player = "X"
        playerChoice = "X"
        animateViewOut(view: choseView)
        self.playerTurn.isHidden = false
        self.playerTurn.text = "Vez: Jogador"
        startGame()
    }
    
    
    @IBAction func btnPlayAgain(_ sender: Any) {
        reset()
        animateViewIn(view: choseView)
        animateViewOut(view: finishGameView)
    }
    
    @IBAction func btnGoToMenu(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
    //function to instantiate Game class to start the game
    func startGame(){
        game = Game(player: self.player!)
        self.gameView.isUserInteractionEnabled = true
    }
    
    //function to reset the board to play again
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
    
    //function to load the score
    func loadScoreGame(){
        lbScore.text = "Score\n Jogador: \(scorePlayer)      Computador: \(scoreComputer)"
    }
    
    func insertComputerPosition(position: [Int]){
        switch position {
        case position where position.first == 0 && position.last == 0:
            but0.setTitle(self.player, for: .normal)
        case position where position.first == 0 && position.last == 1:
            but1.setTitle(self.player, for: .normal)
        case position where position.first == 0 && position.last == 2:
            but2.setTitle(self.player, for: .normal)
        case position where position.first == 1 && position.last == 0:
            but3.setTitle(self.player, for: .normal)
        case position where position.first == 1 && position.last == 1:
            but4.setTitle(self.player, for: .normal)
        case position where position.first == 1 && position.last == 2:
            but5.setTitle(self.player, for: .normal)
        case position where position.first == 2 && position.last == 0:
            but6.setTitle(self.player, for: .normal)
        case position where position.first == 2 && position.last == 1:
            but7.setTitle(self.player, for: .normal)
        default:
            but8.setTitle(self.player, for: .normal)

        }
    }
    
    //functions to create animation os views
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
    
    //function to create alert message in the screen
    func showAlertMessage(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
             let ok = UIAlertAction(title: "Certo!", style: .default, handler: { action in
             })
             alert.addAction(ok)
             DispatchQueue.main.async(execute: {
                self.present(alert, animated: true)
        })
    }
    
    func changeBackgroundCollor(view: UIView){
        view.backgroundColor = .blue
    }
    
    
    
}


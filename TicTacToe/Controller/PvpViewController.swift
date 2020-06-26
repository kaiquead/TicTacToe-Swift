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
    
    //Player
    var player: Int?
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
        player = 0
        UIView.animate(withDuration: 0.3, animations: {
             self.choseView.alpha = 0
        }, completion:  {
           (value: Bool) in
               self.choseView.isHidden = true
        })
    }
    
    @IBAction func choseX(_ sender: Any) {
        player = 1
        UIView.animate(withDuration: 0.3, animations: {
             self.choseView.alpha = 0
        }, completion:  {
           (value: Bool) in
               self.choseView.isHidden = true
        })
    }
    
    
    
    //Functions of click in the game
    @IBAction func btn0(_ sender: Any) {
    }
    
    @IBAction func btn1(_ sender: Any) {
    }
    
    @IBAction func btn2(_ sender: Any) {
    }
    
    
    
    @IBAction func btn3(_ sender: Any) {
    }
    
    @IBAction func btn4(_ sender: Any) {
    }
    
    @IBAction func btn5(_ sender: Any) {
    }
    
    
    
    @IBAction func btn6(_ sender: Any) {
    }
    
    @IBAction func btn7(_ sender: Any) {
    }
    
    @IBAction func btn8(_ sender: Any) {
    }
    
    
}

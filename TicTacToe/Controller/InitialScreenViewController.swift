//
//  ViewController.swift
//  TicTacToe
//
//  Created by Kaique Alves on 24/06/20.
//  Copyright © 2020 Kaique Alves. All rights reserved.
//

import UIKit

class InitialScreenViewController: UIViewController {
    
    //buttons
    @IBOutlet weak var btnPvp: UIButton!
    @IBOutlet weak var btnPvc: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
        btnPvp.titleLabel?.adjustsFontSizeToFitWidth = true
        btnPvc.titleLabel?.adjustsFontSizeToFitWidth = true
    }


}


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
    
    override func viewWillAppear(_ animated: Bool) {
        blackView.isHidden = false
        btnGotIt.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    //function to make blackView hide with animation
    @IBAction func gotIt(_ sender: Any) {
        UIView.animate(withDuration: 0.3, animations: {
             self.blackView.alpha = 0
        }, completion:  {
           (value: Bool) in
               self.blackView.isHidden = true
        })
        
        gameImage.alpha = 1
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  Game.swift
//  TicTacToe
//
//  Created by Kaique Alves on 26/06/20.
//  Copyright © 2020 Kaique Alves. All rights reserved.
//

import Foundation

class Game{
    
    private var player:String
    private var board: [[String]]!
    
    init(player:String) {
        self.player = player
        self.board = [["","",""], ["","",""], ["","",""]]
    }
    
    func canMakePlay(pst1: Int, pst2: Int)->Bool{
        
        for _ in board{
            if(board[pst1][pst2] != ""){
                return false
            }
        }
        //if condition is not false, set the player in your position and return true
        board[pst1][pst2] = self.player
        player = invertPlayer(player: player)
        return true
    }
    
    func invertPlayer(player: String)->String{
        if(player == "O"){
            self.player = "X"
        } else{
            self.player = "O"
        }
        return self.player
    }
    
    func draw()->Bool{
        for i in 0...board.count-1{
            for j in 0...board[i].count-1{
                if(board[i][j] == ""){
                    return false
                }
            }
        }
        return true
    }
    
    
   
    
}

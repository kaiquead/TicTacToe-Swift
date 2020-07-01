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
    
    func canMakePlayAleatory()->[Int]{
        var stop = false
        var result: [Int] = []
        while(stop==false){
            let pst1 = Int.random(in: 0...2)
            let pst2 = Int.random(in: 0...2)
            for _ in board{
                if(board[pst1][pst2] == ""){
                    board[pst1][pst2] = self.player
                    result.append(pst1)
                    result.append(pst2)
                    player = invertPlayer(player: player)
                    stop = true
                }
            }
        }
        return result
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
    
    func checkVitory()->Int{
        var counterO: Int = 0
        var counterX: Int = 0
        
        //this loop is for check the horizontals and add 1 in your specific counter when found the move. Ex: found X? CounterX add 1
        for i in 0...board.count-1{
            for j in 0...board.count-1{
                if(board[i][j]=="O"){
                    counterO+=1
                }
                if(board[i][j]=="X"){
                    counterX+=1
                }
            }
            if(counterO==3){
                return 0
            } else if(counterX==3){
                return 1
            }
            //if dont found a winner in a line, reset the parameters
            counterO = 0
            counterX = 0
        }
        
        
        //this loop is for check the verticals and add 1 in your specific counter when found the move. Ex: found X? CounterX add 1
        for i in 0...board.count-1{
            for j in 0...board.count-1{
                if(board[j][i]=="O"){
                    counterO+=1
                }
                if(board[j][i]=="X"){
                    counterX+=1
                }
            }
            if(counterO==3){
                return 0
            } else if(counterX==3){
                return 1
            }
            //if dont found a winner in a line, reset the parameters
            counterO = 0
            counterX = 0
        }
        
        
        //this loop is for check the first vertical and add 1 in your specific counter when found the move. Ex: found X? CounterX add 1
        
        for var i in 0...board.count-1{
            for j in 0...board.count-1{
                if(board[i][j]=="O"){
                    counterO+=1
                }
                if(board[i][j]=="X"){
                    counterX+=1
                }
                i+=1
            }
            if(counterO==3){
                return 0
            } else if(counterX==3){
                return 1
            }
            //if dont found a winner in a line, reset the parameters
            counterO = 0
            counterX = 0
            break
        }
        
        
        //this loop is for check the second vertical and add 1 in your specific counter when found the move. Ex: found X? CounterX add 1
               
               for var i in 0...board.count-1{
                for j in stride(from: board.count-1, through: 0, by: -1) {
                       if(board[i][j]=="O"){
                           counterO+=1
                       }
                       if(board[i][j]=="X"){
                           counterX+=1
                       }
                       i+=1
                   }
                   if(counterO==3){
                       return 0
                   } else if(counterX==3){
                       return 1
                   }
                   //if dont found a winner in a line, reset the parameters
                   counterO = 0
                   counterX = 0
                   break
               }
        return -1
    }
    
    
   
    
}

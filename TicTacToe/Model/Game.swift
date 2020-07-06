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
    private var sendWinner = false    // used to know if I send the winnerParams to function winParameters()
    private var winnerParams: [String] = []
    
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
        var l: Int = 0
        var c: Int = 0
        let v1: Int = 0
        let v2: Int = 0
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
                if (self.sendWinner != true){
                    winParameters(par1: l, par2: "line")
                    self.sendWinner = true
                }
                return 0
            } else if(counterX==3){
                if (self.sendWinner != true){
                    winParameters(par1: l, par2: "line")
                    self.sendWinner = true
                }
                return 1
            }
            //if dont found a winner in a line, reset the parameters
            counterO = 0
            counterX = 0
            l+=1
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
                if (self.sendWinner != true){
                    winParameters(par1: c, par2: "column")
                    self.sendWinner = true
                }
                return 0
            } else if(counterX==3){
                if (self.sendWinner != true){
                    winParameters(par1: c, par2: "column")
                    self.sendWinner = true
                }
                return 1
            }
            //if dont found a winner in a line, reset the parameters
            counterO = 0
            counterX = 0
            c+=1
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
                if (self.sendWinner != true){
                    winParameters(par1: v1, par2: "vertical1")
                    self.sendWinner = true
                }
                return 0
            } else if(counterX==3){
                if (self.sendWinner != true){
                    winParameters(par1: v1, par2: "vertical1")
                    self.sendWinner = true
                }
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
                    if (self.sendWinner != true){winParameters(par1: v2, par2: "vertical2")}
                       return 0
                   } else if(counterX==3){
                    if (self.sendWinner != true){winParameters(par1: v2, par2: "vertical2")}
                       return 1
                   }
                   //if dont found a winner in a line, reset the parameters
                   counterO = 0
                   counterX = 0
                   break
               }
        return -1
    }
    
    func winParameters(par1: Int, par2: String){
        let params: [String] = ["\(par1)", "\(par2)"]
        
        switch params {
        case params where params.first == "0" && params.last == "line":
            self.winnerParams.append("0")
            self.winnerParams.append("1")
            self.winnerParams.append("2")
            break
            
        case params where params.first == "1" && params.last == "line":
            self.winnerParams.append("3")
            self.winnerParams.append("4")
            self.winnerParams.append("5")
            break
            
        case params where params.first == "2" && params.last == "line":
            self.winnerParams.append("6")
            self.winnerParams.append("7")
            self.winnerParams.append("8")
            break
            
        case params where params.first == "0" && params.last == "column":
            self.winnerParams.append("0")
            self.winnerParams.append("3")
            self.winnerParams.append("6")
            break
            
        case params where params.first == "1" && params.last == "column":
            self.winnerParams.append("1")
            self.winnerParams.append("4")
            self.winnerParams.append("7")
            break
            
        case params where params.first == "2" && params.last == "column":
            self.winnerParams.append("2")
            self.winnerParams.append("5")
            self.winnerParams.append("8")
            break
            
        case params where params.first == "0" && params.last == "vertical1":
            self.winnerParams.append("0")
            self.winnerParams.append("4")
            self.winnerParams.append("8")
            break
            
        default:
            self.winnerParams.append("2")
            self.winnerParams.append("4")
            self.winnerParams.append("6")
            break
        }
    }
    
    func getWinnerParams()->[String]{
        return self.winnerParams
    }
    
    
   
    
}

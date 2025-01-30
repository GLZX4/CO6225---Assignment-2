//
//  Set.swift
//  TennisStarter
//
//  Created by GEORGE HARRISON on 30/01/2025.
//  Copyright © 2025 University of Chester. All rights reserved.
//

class Set {
    private var player1WonGames: Int = 0
    private var player2WonGames: Int = 0
    private var tieBreak: Bool = false
    
    func addGamePlayer1() {
        if !complete() {
            player1WonGames += 1
        }
    }
    
    func addGamePlayer2() {
        if !complete() {
            player2WonGames += 1
        }
    }
    
    func returnCurrentGamesPlayer1() -> Int{
        return player1WonGames
    }
    
    func returnCurrentGamesPlayer2() -> Int{
        return player2WonGames
    }
    
    func returnTieBreak() -> Bool {
        return tieBreak
    }
    
    func complete() -> Bool {
        return hasWon(player1WonGames, player2WonGames) || hasWon(player2WonGames, player1WonGames)
    }
    
    //Helper Functions
    private func hasWon(_ playerGames: Int, _ opponentGames: Int) -> Bool {
         return playerGames >= 6 && playerGames - opponentGames >= 2
     }
    
    private func tieBreakCheck() {
        if player1WonGames == 6 && player2WonGames == 6 {
            return tieBreak = true
        }
    }

    
}

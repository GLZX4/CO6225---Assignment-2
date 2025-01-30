//
//  Match .swift
//  TennisStarter
//
//  Created by GEORGE HARRISON on 30/01/2025.
//  Copyright © 2025 University of Chester. All rights reserved.
//

class Match {
    private var player1SetsWon: Int = 0
    private var player2SetsWon: Int = 0
    private var currentSet: Set = Set()

    func addGameToPlayer1() {
        currentSet.addGamePlayer1()
        if currentSet.complete() {
            if currentSet.returnCurrentGamesPlayer1() > currentSet.returnCurrentGamesPlayer2() {
                player1SetsWon += 1
            } else {
                player2SetsWon += 1
            }
            if !complete() {
                currentSet = Set()
            }
        }
    }

    func addGameToPlayer2() {
        currentSet.addGamePlayer2()
        if currentSet.complete() {
            if currentSet.returnCurrentGamesPlayer1() > currentSet.returnCurrentGamesPlayer2() {
                player1SetsWon += 1
            } else {
                player2SetsWon += 1
            }
            if !complete() {
                currentSet = Set()
            }
        }
    }

    func player1Sets() -> Int {
        return player1SetsWon
    }

    func player2Sets() -> Int {
        return player2SetsWon
    }

    func currentSetGamesForPlayer1() -> Int {
        return currentSet.returnCurrentGamesPlayer1()
    }

    func currentSetGamesForPlayer2() -> Int {
        return currentSet.returnCurrentGamesPlayer2()
    }

    func complete() -> Bool {
        return player1SetsWon == 3 || player2SetsWon == 3
    }

    func winner() -> String? {
        if complete() {
            return player1SetsWon > player2SetsWon ? "Player 1" : "Player 2"
        }
        return nil
    }
}

class Game {
      
    private var player1: Int = 0
    private var player2: Int = 0
    private let match: Match = Match()
    
    private static let pointValue = ["0","15", "30", "40", "A"]
    /**
     This method will be called when player 1 wins a point and update the state of the instance of Game to reflect the change
     */
    func addPointToPlayer1(){
        if !complete() {
            player1 += 1
            if player1Won() {
                match.addGameToPlayer1()
                resetGame()
            }
        }
    }
    
    /**
     This method will be called when player 2 wins a point
     */
    func addPointToPlayer2(){
        if !complete() {
            player2 += 1
            if player2Won() {
                match.addGameToPlayer2()
                resetGame()
            }
        }
    }

    /**
     Returns the score for player 1, this will only ever be "0","15","30","40" or "A"
     If the game is complete, this should return an empty string
     */
    func player1Score() -> String {
        return scoreToString(for: player1, opponent: player2)
        
    }

    /**
     Returns the score for player 2, this will only ever be "0","15","30","40" or "A"
     If the game is complete, this should return an empty string
     */
    func player2Score() -> String {
        return scoreToString(for: player2, opponent: player1)

    }
    
    func currentSetGamesForPlayer1() -> Int {
        return match.currentSetGamesForPlayer1()
    }

    func currentSetGamesForPlayer2() -> Int {
        return match.currentSetGamesForPlayer2()
    }

    func player1Sets() -> Int {
        return match.player1Sets()
    }

    func player2Sets() -> Int {
        return match.player2Sets()
    }
    
    /**
     Returns true if player 1 has won the game, false otherwise
     */
    func player1Won() -> Bool{
        return hasWon(playerPoints: player1, opponentPoints: player2)

    }
    
    /**
     Returns true if player 2 has won the game, false otherwise
     */
    func player2Won() -> Bool{
        return hasWon(playerPoints: player2, opponentPoints: player1)
        
    }
    
    /**
     Returns true if the game is finished, false otherwise
     */
    func complete() ->Bool {
        return player1Won() || player2Won()
        
    }
    
    func winner() -> String {
        return match.winner()
    }
    

    /**
     If player 1 would win the game if they won the next point, returns the number of points player 2 would need to win to equalise the score, otherwise returns 0
     e.g. if the score is 40:15 to player 1, player 1 would win if they scored the next point, and player 2 would need 2 points in a row to prevent that, so this method should return 2 in that case.
     */
    func gamePointsForPlayer1() -> Int{
        return requiredToEqualize(winningPlayer: player1, losingPlayer: player2)

    }
    
    /**
     If player 2 would win the game if they won the next point, returns the number of points player 1 would need to win to equalise the score
     */
    func gamePointsForPlayer2() -> Int {
        return requiredToEqualize(winningPlayer: player2, losingPlayer: player1)
        
    }
    
    
    //Helper Functions below, Must remain private
    private func hasWon(playerPoints: Int, opponentPoints: Int) -> Bool {
        return playerPoints >= 4 && playerPoints - opponentPoints >= 2
    }
    
    private func scoreToString(for player: Int, opponent: Int) -> String {
        if complete() { return "" }
        if player >= 3 && opponent >= 3 {
            if player == opponent { return "40" }
            return player > opponent ? "A" : "40"
        }
        return Game.pointValue[min(player, 4)]
    }
    
    private func requiredToEqualize(winningPlayer: Int, losingPlayer: Int) -> Int {
        if winningPlayer == 3 && losingPlayer < 3 {
            return 3 - losingPlayer
        } else if winningPlayer == 4 && losingPlayer == 3 {
            return 1
        } else if winningPlayer >= 4 && losingPlayer >= 3 {
            return max(0, winningPlayer - losingPlayer - 1)
        }
        return 0
    }
    
    private func resetGame() {
        player1 = 0
        player2 = 0
    }
}

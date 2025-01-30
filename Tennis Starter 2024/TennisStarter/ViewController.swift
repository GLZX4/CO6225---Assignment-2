import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var p1Button: UIButton!
    @IBOutlet weak var p2Button: UIButton!
    @IBOutlet weak var p1NameLabel: UILabel!
    @IBOutlet weak var p2NameLabel: UILabel!

    @IBOutlet weak var p1PointsLabel: UILabel!
    @IBOutlet weak var p2PointsLabel: UILabel!

    @IBOutlet weak var p1GamesLabel: UILabel!
    @IBOutlet weak var p2GamesLabel: UILabel!

    @IBOutlet weak var p1SetsLabel: UILabel!
    @IBOutlet weak var p2SetsLabel: UILabel!

    @IBOutlet weak var p1PreviousSetsLabel: UILabel!
    @IBOutlet weak var p2PreviousSetsLabel: UILabel!

    private var game = Game() // Instantiate the Game logic
    var audioPlayer: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    /********Methods*********/
    @IBAction func p1AddPointPressed(_ sender: UIButton) {
        game.addPointToPlayer1()
        if game.complete() {
            showWinnerAlert()
        }
        updateUI()
    }

    @IBAction func p2AddPointPressed(_ sender: UIButton) {
        game.addPointToPlayer2()
        if game.complete() {
            showWinnerAlert()
        }
        updateUI()
    }

    @IBAction func restartPressed(_ sender: AnyObject) {
        game = Game() // Reset the game logic
        updateUI()
    }

    private func updateUI() {
        // Update points
        p1PointsLabel.text = game.player1Score()
        p2PointsLabel.text = game.player2Score()

        // Update games
        p1GamesLabel.text = "\(game.currentSetGamesForPlayer1())"
        p2GamesLabel.text = "\(game.currentSetGamesForPlayer2())"

        // Update sets
        p1SetsLabel.text = "\(game.player1Sets())"
        p2SetsLabel.text = "\(game.player2Sets())"

        // Update previous sets (optional)
        // Add functionality to track and display previous sets if required

        // Enable or disable buttons if the match is complete
        p1Button.isEnabled = !game.complete()
        p2Button.isEnabled = !game.complete()
    }

    private func showWinnerAlert() {
        let winner = game.winner() ?? "Unknown"
        let alert = UIAlertController(title: "Match Over", message: "\(winner) wins the match!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    private func playSound(named soundName: String) {
        if let soundURL = Bundle.main.url(forResource: soundName, withExtension: "wav") {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
                audioPlayer?.play()
            } catch {
                print("Error playing sound: \(error.localizedDescription)")
            }
        } else {
            print("Sound file '\(soundName).wav' not found in bundle.")
        }
    }

}

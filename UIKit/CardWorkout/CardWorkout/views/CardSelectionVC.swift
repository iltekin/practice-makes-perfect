//
//  CardSelectionVC.swift
//  CardWorkout
//
//  Created by Sezer İltekin on 17.10.2022.
//

import UIKit
import AVFoundation

class CardSelectionVC: UIViewController {
    @IBOutlet weak var cardImageView: UIImageView!
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var speedSegment: UISegmentedControl!
    @IBOutlet weak var stopButton: UIButton!
    
    private let speeds = [0.2, 0.1, 0.05]
    
    private var cards = Cards().allCards
    private var timer: Timer!
    private var shuffleSound: AVAudioPlayer?


    override func viewDidLoad() {
        super.viewDidLoad()
        buttons[1].isEnabled = false
        
        for button in buttons {
            button.layer.cornerRadius = 10
        }
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(getRandomCard))
        cardImageView.addGestureRecognizer(tap)
        cardImageView.isUserInteractionEnabled = true
        
        cardImageView.image = cards.randomElement()
                
    }
    
    private func startTimer() {
        buttons[1].isEnabled = true
        buttons[2].isEnabled = false
        speedSegment.isEnabled = false
        
        let speedSegmentIndex = speedSegment.selectedSegmentIndex
        let speed = speeds[speedSegmentIndex]
        
        timer = Timer.scheduledTimer(timeInterval: speed, target: self, selector: #selector(getRandomCard), userInfo: nil, repeats: true)
    }
    
    private func stopTimer() {
        timer.invalidate()
        buttons[1].isEnabled = false
        buttons[2].isEnabled = true
        speedSegment.isEnabled = true
    }
    
    private func playShuffleSound() {
        let path = Bundle.main.path(forResource: "shuffle", ofType: "mp3")!
        let url = URL(fileURLWithPath: path)
        do {
            shuffleSound = try AVAudioPlayer(contentsOf: url)
            shuffleSound?.play()
        } catch {
            print("Error when playing sound!")
        }
    }

    @objc func getRandomCard() {
        cardImageView.image = cards.randomElement() ?? UIImage(named: "AH")
        playShuffleSound()
    }
    
    @IBAction func stopButtonTapped(_ sender: Any) {
        stopTimer()
    }
    
    @IBAction func restartButtonTapped(_ sender: Any) {
        startTimer()
    }
    
}

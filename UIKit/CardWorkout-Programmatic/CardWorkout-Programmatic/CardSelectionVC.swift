//
//  CardSelectionVC.swift
//  CardWorkout-Programmatic
//
//  Created by Sezer İltekin on 19.10.2022.
//

import UIKit

class CardSelectionVC: UIViewController {
	
	let cardImageView 	= UIImageView()
	let stopButton 		= CWButton(backgroundColor: .systemRed, title: "STOP")
	let startButton		= CWButton(backgroundColor: .systemGreen, title: "START")
	let rulesButton		= CWButton(backgroundColor: .systemBlue, title: "RULES")
	let cards 			= Cards().allCards
	var timer: Timer!

    override func viewDidLoad() {
        super.viewDidLoad()
		view.backgroundColor = .systemBackground
		configureUI()
	}
	
	override func viewDidDisappear(_ animated: Bool) {
		stopTimer()
	}

	func configureUI() {
		configureCardImageView()
		configureStopButton()
		configureStartButton()
		configureRulesButton()
	}
	
	func configureCardImageView() {
		view.addSubview(cardImageView)
		cardImageView.translatesAutoresizingMaskIntoConstraints = false
		cardImageView.image = UIImage(named: "AS")
		
		NSLayoutConstraint.activate([
			cardImageView.widthAnchor.constraint(equalToConstant: 250),
			cardImageView.heightAnchor.constraint(equalToConstant: 350),
			cardImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			cardImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -75),
		])
		
	}
	
	func configureStopButton() {
		view.addSubview(stopButton)
		stopButton.isEnabled = false
		stopButton.addTarget(self, action: #selector(stopShuffle), for: .touchUpInside)

		NSLayoutConstraint.activate([
			stopButton.widthAnchor.constraint(equalToConstant: 250),
			stopButton.heightAnchor.constraint(equalToConstant: 55),
			stopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			stopButton.topAnchor.constraint(equalTo: cardImageView.bottomAnchor, constant: 30),
		])
	}
	
	func configureStartButton() {
		view.addSubview(startButton)
		startButton.addTarget(self, action: #selector(startShuffle), for: .touchUpInside)
		
		NSLayoutConstraint.activate([
			startButton.widthAnchor.constraint(equalToConstant: 115),
			startButton.heightAnchor.constraint(equalToConstant: 55),
			startButton.leadingAnchor.constraint(equalTo: stopButton.leadingAnchor),
			startButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 20),
		])
	}
	
	func configureRulesButton() {
		view.addSubview(rulesButton)
		rulesButton.addTarget(self, action: #selector(presentRulesVC), for: .touchUpInside)
		
		NSLayoutConstraint.activate([
			rulesButton.widthAnchor.constraint(equalToConstant: 115),
			rulesButton.heightAnchor.constraint(equalToConstant: 55),
			rulesButton.trailingAnchor.constraint(equalTo: stopButton.trailingAnchor),
			rulesButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 20)
		])
	}
	
	@objc func presentRulesVC() {
		present(RulesVC(), animated: true)
	}
	
	@objc func startShuffle() {
		startButton.isEnabled = false
		stopButton.isEnabled = true
		startTimer()
	}
	
	@objc func stopShuffle() {
		stopButton.isEnabled = false
		startButton.isEnabled = true
		stopTimer()
	}
	
	func startTimer() {
		timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(getRandomCard), userInfo: nil, repeats: true)
	}
	
	func stopTimer() {
		timer.invalidate()
	}
	
	@objc func getRandomCard() {
		cardImageView.image = cards.randomElement() ?? UIImage(named: "AS")
	}
	
}

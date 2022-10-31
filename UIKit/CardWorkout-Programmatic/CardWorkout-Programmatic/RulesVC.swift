//
//  RulesVC.swift
//  CardWorkout-Programmatic
//
//  Created by Sezer İltekin on 30.10.2022.
//

import UIKit

class RulesVC: UIViewController {
	
	let titleLabel 		= UILabel()
	let rulesLabel 		= UILabel()
	let exercisesLabel	= UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
		view.backgroundColor = .systemBackground
		configureTitleLabel()
		configureRulesLabel()
		configureExercisesLabel()
    }
	
	func configureTitleLabel() {
		view.addSubview(titleLabel)
		titleLabel.translatesAutoresizingMaskIntoConstraints = false
		titleLabel.text = "Rules"
		titleLabel.textAlignment = .center
		titleLabel.font = .systemFont(ofSize: 28, weight: .bold)
		
		NSLayoutConstraint.activate([
			titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			titleLabel.widthAnchor.constraint(equalToConstant: 300),
			titleLabel.heightAnchor.constraint(equalToConstant: 200),
			titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
		])
	}
	
	func configureRulesLabel() {
		view.addSubview(rulesLabel)
		rulesLabel.translatesAutoresizingMaskIntoConstraints = false
		rulesLabel.text = "The value of each card represents the number of exercise you do. \n\n J = 11, Q = 12, K = 13, A = 14"
		rulesLabel.textAlignment = .center
		rulesLabel.font = .systemFont(ofSize: 20, weight: .regular)
		rulesLabel.lineBreakMode = .byWordWrapping
		rulesLabel.numberOfLines = .zero
		
		NSLayoutConstraint.activate([
			rulesLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
			rulesLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
			rulesLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30)
		])
	}
	
	func configureExercisesLabel() {
		view.addSubview(exercisesLabel)
		exercisesLabel.translatesAutoresizingMaskIntoConstraints = false
		exercisesLabel.text = "♠️ = Push-ups \n\n♣️ = Sit-ups \n\n♦️ = Burpees \n\n❤️ = Jumping Jacks"
		exercisesLabel.font = .systemFont(ofSize: 20, weight: .regular)
		exercisesLabel.lineBreakMode = .byWordWrapping
		exercisesLabel.numberOfLines = 0
		
		NSLayoutConstraint.activate([
			exercisesLabel.topAnchor.constraint(equalTo: rulesLabel.bottomAnchor, constant: 50),
			exercisesLabel.widthAnchor.constraint(equalToConstant: 200),
			exercisesLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
		])
	}

}

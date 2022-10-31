//
//  CWButton.swift
//  CardWorkout-Programmatic
//
//  Created by Sezer İltekin on 19.10.2022.
//

import UIKit

class CWButton: UIButton {
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		configure()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	init(backgroundColor: UIColor, title: String){
		super.init(frame: .zero)
		configure()
		self.backgroundColor = backgroundColor
		self.setTitle(title, for: .normal)
	}
	
	func configure() {
		layer.cornerRadius = 8
		titleLabel?.font = .systemFont(ofSize: 19, weight: .bold)
		setTitleColor(.white, for: .normal)
		setTitleColor(.secondaryLabel, for: .disabled)
		translatesAutoresizingMaskIntoConstraints = false
		
	}
	
}

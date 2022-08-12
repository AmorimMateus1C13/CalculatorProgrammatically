//
//  SurveyButton.swift
//  CalculatorAdvancedViewCode
//
//  Created by Mateus Amorim on 11/08/22.
//

import Foundation
import UIKit

class SurveyButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }    
    
    func setupButtonBlue() {
        setTitleColor(.white, for: .normal)
        backgroundColor = UIColor(red: 29/255, green: 155/255, blue: 246/255, alpha: 1)
        titleLabel?.font = UIFont.systemFont(ofSize: 25)
    }
    
    func setupColorOrange() {
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 25)
        backgroundColor = .orange
    }
    
    func setupColorDGray() {
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 25)
        backgroundColor = .darkGray
    }
}

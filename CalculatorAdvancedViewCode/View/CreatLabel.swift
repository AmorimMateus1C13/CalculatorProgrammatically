//
//  CreatLabel.swift
//  CalculatorAdvancedViewCode
//
//  Created by Mateus Amorim on 12/08/22.
//

import Foundation
import UIKit

class CreatLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func properties() {
        numberOfLines = 1
        textColor = .white
        font = UIFont.systemFont(ofSize: 50)
        textAlignment = .right
//        backgroundColor = UIColor(red: 66 / 255, green: 66 / 255, blue: 66 / 255, alpha: 1)
        text = "0"
    }
}

//
//  CreatStackView.swift
//  CalculatorAdvancedViewCode
//
//  Created by Mateus Amorim on 11/08/22.
//

import Foundation
import UIKit

class CreatStackView: UIStackView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func properties (_ stack: UIStackView) {
        stack.axis = .horizontal
        stack.spacing = 1
        stack.distribution = .fillEqually
        stack.alignment = .fill
    }
}

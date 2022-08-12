//
//  ViewConfiguration.swift
//  CalculatorAdvancedViewCode
//
//  Created by Mateus Amorim on 11/08/22.
//

import Foundation

protocol ViewConfiguration {
    func setupViewConfiguration()
    func buildViewHierachy()
    func setupConstraints()
}

extension ViewConfiguration {
    func setupViewConfiguration() {
        buildViewHierachy()
        setupConstraints()
    }
}

//
//  CalculatorController.swift
//  CalculatorAdvancedViewCode
//
//  Created by Mateus Amorim on 11/08/22.
//
import UIKit
import SnapKit

class CalculatorController: UIViewController {
    
    let calculator = CalculatoView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(calculator)
        view.backgroundColor = UIColor(red: 66 / 255, green: 66 / 255, blue: 66 / 255, alpha: 1)
        makeConstraints()
    }
    
    func makeConstraints () {
        calculator.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

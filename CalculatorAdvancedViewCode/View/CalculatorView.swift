//
//  CalculatorView.swift
//  CalculatorAdvancedViewCode
//
//  Created by Mateus Amorim on 11/08/22.
//

import UIKit
import SnapKit

class CalculatoView: UIView {
    
    private var isFinishingTypingNumber: Bool = true
    private var calculator = CalculateLogic()
    var secondDoc = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewConfiguration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - UILabel
    
    var labelCalc: CreatLabel = {
        var lbl = CreatLabel()
        lbl.properties()
        return lbl
    }()
    
    //MARK: - StackView Vertical
    
    lazy var stackViewVertical: UIStackView = {
        let stackViewVertical = UIStackView()
        stackViewVertical.axis = .vertical
        stackViewVertical.distribution = .fillEqually
        stackViewVertical.alignment = .fill
        stackViewVertical.spacing = 1
        stackViewVertical.contentMode = .scaleToFill
        addStackView(stackVertical: stackViewVertical)
        return stackViewVertical
    }()
    
    //MARK: - Calculations Functions :
    
    private var displayValue: Double {
        get{
            guard let currentDisplayValue = Double(labelCalc.text!) else {
                fatalError("Error to convert display.text to a Double")
            }
            return currentDisplayValue
        }
        set{
            if newValue.isInteger == true {
                labelCalc.text = String(format: "%.0f", newValue)
            }else {
                labelCalc.text = String(newValue)
            }
        }
    }
    
    @objc func functionsPressed (_ sender: UIButton) {
        isFinishingTypingNumber = true
        calculator.setNumber(displayValue)
        if let calMethod = sender.currentTitle {
            if let result = calculator.calculate(symbol: calMethod) {
                displayValue = result
            }
        }
    }
    
    @objc func numbersPressed (_ sender: UIButton) {
        if let numValue = sender.currentTitle {
            if isFinishingTypingNumber == true {
                labelCalc.text = numValue
                isFinishingTypingNumber = false
            }else {
                if numValue == "." {
                    secondDoc += 1
                    var isInt = floor(displayValue) == displayValue
                    if isInt == true {
                        if secondDoc >= 2 {
                            isInt = false
                        }
                    }
                    if !isInt {
                        return
                    }
                }
                labelCalc.text = labelCalc.text! + numValue
            }
        }
    }
    
    //MARK: - func Add buttons
    
    func addButtonToStackView(stack: UIStackView, level: Int){
        
        switch level {
        case 1:
            let numberOfButton = 4
            for i in 1...numberOfButton {
                let button = SurveyButton()
                button.setupColorDGray()
                button.addTarget(self, action: #selector(functionsPressed), for: .touchUpInside)
                if i == 1 {
                    button.setTitle("A/C", for: .normal)
                }else if i == 2 {
                    button.setTitle("+/-", for: .normal)
                }else if i == 3 {
                    button.setTitle("%", for: .normal)
                }else {
                    button.setTitle("÷", for: .normal)
                    button.setupColorOrange()
                }
                stack.addArrangedSubview(button)
            }
            return
        case 2:
            let numberOfButton = 4
            for i in 1...numberOfButton {
                let button = SurveyButton()
                
                if i == 1 {
                    button.setTitle("7", for: .normal)
                    button.addTarget(self, action: #selector(numbersPressed), for: .touchUpInside)
                    button.setupButtonBlue()
                }else if i == 2 {
                    button.setTitle("8", for: .normal)
                    button.addTarget(self, action: #selector(numbersPressed), for: .touchUpInside)
                    button.setupButtonBlue()
                }else if i == 3 {
                    button.setTitle("9", for: .normal)
                    button.addTarget(self, action: #selector(numbersPressed), for: .touchUpInside)
                    button.setupButtonBlue()
                }else {
                    button.setTitle("x", for: .normal)
                    button.addTarget(self, action: #selector(functionsPressed), for: .touchUpInside)
                    button.setupColorOrange()
                }
                stack.addArrangedSubview(button)
            }
            return
        case 3:
            let numberOfButton = 4
            for i in 1...numberOfButton {
                let button = SurveyButton()
                button.setupButtonBlue()
                if i == 1 {
                    button.setTitle("4", for: .normal)
                    button.addTarget(self, action: #selector(numbersPressed), for: .touchUpInside)
                }else if i == 2 {
                    button.setTitle("5", for: .normal)
                    button.addTarget(self, action: #selector(numbersPressed), for: .touchUpInside)
                }else if i == 3 {
                    button.setTitle("6", for: .normal)
                    button.addTarget(self, action: #selector(numbersPressed), for: .touchUpInside)
                }else {
                    button.setTitle("-", for: .normal)
                    button.addTarget(self, action: #selector(functionsPressed), for: .touchUpInside)
                    button.setupColorOrange()
                }
                stack.addArrangedSubview(button)
            }
            return
        case 4:
            let numberOfButton = 4
            for i in 1...numberOfButton {
                let button = SurveyButton()
                button.setupButtonBlue()
                if i == 1 {
                    button.setTitle("1", for: .normal)
                    button.addTarget(self, action: #selector(numbersPressed), for: .touchUpInside)
                }else if i == 2 {
                    button.setTitle("2", for: .normal)
                    button.addTarget(self, action: #selector(numbersPressed), for: .touchUpInside)
                }else if i == 3 {
                    button.setTitle("3", for: .normal)
                    button.addTarget(self, action: #selector(numbersPressed), for: .touchUpInside)
                }else {
                    button.setTitle("+", for: .normal)
                    button.addTarget(self, action: #selector(functionsPressed), for: .touchUpInside)
                    button.setupColorOrange()
                }
                stack.addArrangedSubview(button)
            }
            return
        case 5:
            let button = SurveyButton()
            button.setupButtonBlue()
            button.setTitle("0", for: .normal)
            button.addTarget(self, action: #selector(numbersPressed), for: .touchUpInside)
            stack.addArrangedSubview(button)
            return
        case 6:
            let numberOsButton = 2
            for i in 1...numberOsButton {
                let button = SurveyButton()
                if i == 1{
                    button.setTitle(".", for: .normal)
                    button.addTarget(self, action: #selector(numbersPressed), for: .touchUpInside)
                    button.setupButtonBlue()
                }else{
                    button.setTitle("=", for: .normal)
                    button.addTarget(self, action: #selector(functionsPressed), for: .touchUpInside)
                    button.setupColorOrange()
                }
                stack.addArrangedSubview(button)
            }
            return
        default:
           return
            print("Cannot make switch statement")
        }
    }
    
    //MARK: - Func: Add Stack and Views
    
    func addStackView (stackVertical: UIStackView) {
        let numberOfStack = 5
        for i in 0...numberOfStack {
            let view = CreatView()
            let stack = CreatStackView()
            stack.properties(stack)
            if i == 0{
                view.addSubview(labelCalc)
                labelCalc.snp.makeConstraints { make in
                    make.edges.equalToSuperview()
                }
            }
            else if i == 1 {
                addButtonToStackView(stack: stack, level: i)
                view.addSubview(stack)
                stack.snp.makeConstraints { make in
                    make.edges.equalToSuperview()
                }
            }else if i == 2{
                addButtonToStackView(stack: stack, level: i)
                view.addSubview(stack)
                stack.snp.makeConstraints { make in
                    make.edges.equalToSuperview()
                }
            }else if i == 3 {
                addButtonToStackView(stack: stack, level: i)
                view.addSubview(stack)
                stack.snp.makeConstraints { make in
                    make.edges.equalToSuperview()
                }
            }else if i == 4 {
                addButtonToStackView(stack: stack, level: i)
                view.addSubview(stack)
                stack.snp.makeConstraints { make in
                    make.edges.equalToSuperview()
                }
            }else {
                addButtonToStackView(stack: stack, level: i)
                view.addSubview(stack)
                stack.snp.makeConstraints { make in
                    make.edges.equalToSuperview()
                }
                
                let viewSub = CreatView()
                stack.addArrangedSubview(viewSub)
                
                let stackSub = CreatStackView()
                addButtonToStackView(stack: stackSub, level: i+1)
                stackSub.properties(stackSub)
                viewSub.addSubview(stackSub)
                stackSub.snp.makeConstraints { make in
                    make.edges.equalToSuperview()
                    }
            }
            stackVertical.addArrangedSubview(view)
        }
    }
}

    //MARK: - Extension ViewConfiguration

extension CalculatoView: ViewConfiguration {
    
    func buildViewHierachy() {
         addSubview(stackViewVertical)
    }
    
    func setupConstraints() {
        
        stackViewVertical.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(36)
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview()
            make.bottom.equalToSuperview().inset(24)
        }
    }
}

    //MARK: - Extension FloatingPoint

extension FloatingPoint {
    var isInteger: Bool { rounded() == self }
}

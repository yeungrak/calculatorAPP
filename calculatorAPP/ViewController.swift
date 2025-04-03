//
//  ViewController.swift
//  calculatorAPP
//
//  Created by 최영락 on 3/27/25.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    
    //계산기의 레이블, 버튼등 구성요소 만들기
    private var firstNumber = "0"
    private let label = UILabel()
    private let stackView = UIStackView()
    private let plusButton = UIButton()
    private let minusButton = UIButton()
    private let divisionButton = UIButton()
    private let multiplyButton = UIButton()
    private let resetButton = UIButton()
    private let resultButton = UIButton()
    
    //숫자 버튼 만들기==
    private let numberButton: [UIButton] = (0...9).map { num in
        let button = UIButton()
        button.setTitle("\(num)", for: .normal)
        button.backgroundColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
        button.layer.cornerRadius = 40
        button.titleLabel?.font = .boldSystemFont(ofSize: 30)
        button.addTarget(self, action: #selector(numberButtonTapped), for: .touchDown)
        button.snp.makeConstraints { $0.size.equalTo(80) }
        return button
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    //스택뷰를 만드는 함수 만들기
    private func makeHoizontalStackView(views: [UIView]) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: views)
        //uiView를 써야함
        stackView.axis = .horizontal
        stackView.backgroundColor = .black
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        return stackView
    }
    
    
    
    private func configure() {
        view.backgroundColor = .black
        
        
        //stackView를 만드는 함수를 이용해 1~4까지의 스택뷰 만들기
        let stackView = makeHoizontalStackView(views: [numberButton[7], numberButton[8], numberButton[9], plusButton])
        let stackView2 = makeHoizontalStackView(views: [numberButton[4], numberButton[5], numberButton[6], minusButton])
        let stackView3 = makeHoizontalStackView(views: [numberButton[1], numberButton[2], numberButton[3], multiplyButton])
        let stackView4 = makeHoizontalStackView(views: [resetButton, numberButton[0], resultButton, divisionButton])
        let verticalStackView = UIStackView(arrangedSubviews: [stackView, stackView2, stackView3, stackView4])
        
        
        
        //lable 구성요소
        label.text = "0"
        label.textColor = .white
        label.textAlignment = .right
        label.font = UIFont.boldSystemFont(ofSize: 60)
        
        //plusbutton 구성요소
        plusButton.setTitle("+", for: .normal)
        plusButton.backgroundColor = .orange
        plusButton.layer.cornerRadius = 40
        plusButton.titleLabel?.font = .boldSystemFont(ofSize: 30)
        plusButton.addTarget(self, action: #selector(plusButtonTapped), for: .touchDown)
        plusButton.snp.makeConstraints { $0.size.equalTo(80) }
        
        //minusbutton 구성요소
        minusButton.setTitle("-", for: .normal)
        minusButton.backgroundColor = .orange
        minusButton.layer.cornerRadius = 40
        minusButton.titleLabel?.font = .boldSystemFont(ofSize: 30)
        minusButton.addTarget(self, action: #selector(minusButtonTapped), for: .touchDown)
        minusButton.snp.makeConstraints { $0.size.equalTo(80) }
        
        //divisionButton 구성요소
        divisionButton.setTitle("/", for: .normal)
        divisionButton.backgroundColor = .orange
        divisionButton.layer.cornerRadius = 40
        divisionButton.titleLabel?.font = .boldSystemFont(ofSize: 30)
        divisionButton.addTarget(self, action: #selector(divisionButtonTapped), for: .touchDown)
        divisionButton.snp.makeConstraints { $0.size.equalTo(80) }
        
        //multiplyButton 구성요소
        multiplyButton.setTitle("*", for: .normal)
        multiplyButton.backgroundColor = .orange
        multiplyButton.layer.cornerRadius = 40
        multiplyButton.titleLabel?.font = .boldSystemFont(ofSize: 30)
        multiplyButton.addTarget(self, action: #selector(multiplyButtonTapped), for: .touchDown)
        multiplyButton.snp.makeConstraints { $0.size.equalTo(80) }
        
        //resetButton 구성요소
        resetButton.setTitle("AC", for: .normal)
        resetButton.backgroundColor = .orange
        resetButton.layer.cornerRadius = 40
        resetButton.titleLabel?.font = .boldSystemFont(ofSize: 30)
        resetButton.addTarget(self, action: #selector(resetButtonTapped), for: .touchDown)
        resetButton.snp.makeConstraints { $0.size.equalTo(80) }
        
        //resultButton 구성요소
        resultButton.setTitle("=", for: .normal)
        resultButton.backgroundColor = .orange
        resultButton.layer.cornerRadius = 40
        resultButton.titleLabel?.font = .boldSystemFont(ofSize: 30)
        resultButton.addTarget(self, action: #selector (resultValue), for: .touchDown)
        resultButton.snp.makeConstraints { $0.size.equalTo(80) }
        
        //verticalStackView 구성요소
        verticalStackView.axis = .vertical
        verticalStackView.backgroundColor = .black
        verticalStackView.spacing = 10
        verticalStackView.distribution = .fillEqually
        
        
        //forEach로 한번에 뷰에 추가하기
        [label, verticalStackView]
            .forEach { view.addSubview($0) }
        
        
        
        //label Constraints
        label.snp.makeConstraints {
            $0.leading.equalTo(view.snp.leading).offset(30)
            $0.trailing.equalTo(view.snp.trailing).offset(-30)
            $0.top.equalTo(view.snp.top).offset(200)
            $0.height.equalTo(100)
            $0.width.equalTo(10)
        }
        
        //stackView Constraints
        stackView.snp.makeConstraints{
            $0.height.equalTo(80)
        }
        stackView2.snp.makeConstraints{
            $0.height.equalTo(80)
        }
        stackView3.snp.makeConstraints{
            $0.height.equalTo(80)
        }
        stackView4.snp.makeConstraints{
            $0.height.equalTo(80)
        }
        verticalStackView.snp.makeConstraints {
            $0.width.equalTo(350)
            $0.top.equalTo(label.snp.bottom).offset(60)
            $0.centerX.equalToSuperview()
            
        }
    }
    //버튼을 클릭했을때 동작 + "+"가 입력된 상태에서 +를 입력할경우의 예외상황 제작
    @objc private func plusButtonTapped () {
        let plusButtonException = firstNumber.last
        if plusButtonException == "+" || plusButtonException == "-" || plusButtonException == "*" || plusButtonException == "/" {
            label.text = "\(firstNumber)"
        } else {
            firstNumber += "+"
            label.text = "\(firstNumber)"
        }
    }
    @objc private func minusButtonTapped () {
        let minusButtonException = firstNumber.last
        if minusButtonException == "+" || minusButtonException == "-" || minusButtonException == "*" || minusButtonException == "/" {
            label.text = "\(firstNumber)"
        } else {
            firstNumber += "-"
            label.text = "\(firstNumber)"
        }
    }
    
    @objc private func multiplyButtonTapped () {
        let multiplyButtonException = firstNumber.last
        if multiplyButtonException == "+" || multiplyButtonException == "-" || multiplyButtonException == "*" || multiplyButtonException == "/" {
            label.text = "\(firstNumber)"
        } else {
            firstNumber += "*"
            label.text = "\(firstNumber)"
        }
        
    }
    
    @objc private func divisionButtonTapped () {
        let divisionButtonException = firstNumber.last
        if divisionButtonException == "+" || divisionButtonException == "-" || divisionButtonException == "*" || divisionButtonException == "/"  {
            label.text = "\(firstNumber)"
        } else {
            firstNumber += "/"
            label.text = "\(firstNumber)"
        }
    }
    @objc private func resetButtonTapped () {
        firstNumber = "0"
        label.text = "\(firstNumber)"
    }
    
    @objc private func resultValue () {
        let resultButtonException = firstNumber.last
        if resultButtonException == "=" || resultButtonException == "+" || resultButtonException == "-" || resultButtonException == "*" || resultButtonException == "/" {
            label.text = "\(firstNumber)"
        } else {
            if let result = resultButtonTapped(expression: firstNumber) {
                firstNumber = "\(result)"
                label.text = "\(result)"
            }
        }
    }
    
    @objc private func numberButtonTapped(_ sender: UIButton) {
        guard let numberString = sender.titleLabel?.text else { return }
        if firstNumber == "0" {
            firstNumber = numberString
        } else {
            firstNumber += numberString
        }
        label.text = "\(firstNumber)"
    }
    
    private func resultButtonTapped(expression: String) -> Int? {
        let expression = NSExpression(format: expression)
        if let result = expression.expressionValue(with: nil, context: nil) as? Int {
            return result
        } else {
            return nil
        }
    }
    
}


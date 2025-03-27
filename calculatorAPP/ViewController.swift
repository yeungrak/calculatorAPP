//
//  ViewController.swift
//  calculatorAPP
//
//  Created by 최영락 on 3/27/25.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private let label = UILabel()
    
    private let stackView = UIStackView()
    
    private let numberButton: [UIButton] = (1...9).map { num in
        let button = UIButton()
        button.setTitle("\(num)", for: .normal)
        button.backgroundColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
        button.layer.cornerRadius = 40
        button.snp.makeConstraints { $0.size.equalTo(80) }
        return button
    }
    
    private let plusButton = UIButton()
    
    private let minusButton = UIButton()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
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
        
        //stackView
        let stackView = makeHoizontalStackView(views: [numberButton[6], numberButton[7], numberButton[8], plusButton])
        
        //lable
        label.text = "12345"
        label.textColor = .white
        label.textAlignment = .right
        label.font = UIFont.boldSystemFont(ofSize: 60)
        
        //plusbutton
        plusButton.setTitle("+", for: .normal)
        plusButton.backgroundColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
        plusButton.layer.cornerRadius = 40
        plusButton.snp.makeConstraints { $0.size.equalTo(80) }
        
        //minusbutton
        minusButton.setTitle("-", for: .normal)
        
        
        
        
        
        view.addSubview(label)
        view.addSubview(stackView)
        
        
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
                $0.center.equalToSuperview()
            }
            
        }
        
        
    }

// 일단 버튼마다 상수를 만들고, 거기에 버튼의 설정을 전부다 할당해준다.
//


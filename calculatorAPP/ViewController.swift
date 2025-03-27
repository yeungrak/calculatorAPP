//
//  ViewController.swift
//  calculatorAPP
//
//  Created by 최영락 on 3/27/25.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private let lable = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        view.backgroundColor = .black
        
        lable.text = "12345"
        lable.textColor = .white
        lable.textAlignment = .right
        lable.font = UIFont.boldSystemFont(ofSize: 60)
        
//        [lable]
//            .forEach { view.addSubview($0) }
        view.addSubview(lable)
        lable.snp.makeConstraints {
            $0.leading.equalTo(view.snp.leading).offset(30)
            $0.trailing.equalTo(view.snp.trailing).offset(-30)
            $0.top.equalTo(view.snp.top).offset(200)
            $0.height.equalTo(100)
            $0.width.equalTo(10)
        }
        
    }
}


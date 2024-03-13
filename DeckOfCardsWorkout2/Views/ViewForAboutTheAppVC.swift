//
//  ViewForAboutTheAppVC.swift
//  DeckOfCardsWorkout2
//
//  Created by 김승현 on 3/8/24.
//

import Foundation
import UIKit

class ViewForAboutTheAppVC: UIView {
    lazy var stackViewFor3Btns: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.alignment = .fill
        sv.distribution = .fillEqually
        sv.spacing = 20
        sv.backgroundColor = .clear
        return sv
    }()
    
    lazy var descriptionBtns: [UIButton] = {
        var btnArr = [UIButton]()
        let btnTitleArr = ["운동 설명", "운동 시작", "운동 설정"]
        for num in 0...2 {
            let btn = UIButton()
            btn.tag = num
            btn.setTitle("\(btnTitleArr[num])", for: .normal)
            btn.backgroundColor = Colors().colorArray.randomElement()
            btn.setTitleColor(.darkGray, for: .normal)
            btn.tintColor = .white
            btn.layer.cornerRadius = 10
            btn.clipsToBounds = true
            btn.layer.borderColor = UIColor.darkGray.cgColor
            btn.layer.borderWidth = 1
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
            btnArr.append(btn)
        }
        return btnArr
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        [stackViewFor3Btns].map {
            self.addSubview($0)
        }
        
        descriptionBtns.map {
            stackViewFor3Btns.addArrangedSubview($0)
        }
        
        viewLayoutForAboutTheAppVC()
    }
    
    required init?(coder: NSCoder) {
        fatalError("뷰 초기화 에러 발생!")
    }
    
    func viewLayoutForAboutTheAppVC() {
        stackViewFor3Btns.translatesAutoresizingMaskIntoConstraints = false
        stackViewFor3Btns.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        stackViewFor3Btns.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        stackViewFor3Btns.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5).isActive = true
        stackViewFor3Btns.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.4).isActive = true
    }
    
}

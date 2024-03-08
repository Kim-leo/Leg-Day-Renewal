//
//  View.swift
//  DeckOfCardsWorkout2
//
//  Created by 김승현 on 3/5/24.
//

import Foundation
import UIKit

class ViewForHomeVC: UIView {
    lazy var stackViewForVCBtns: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.alignment = .fill
        sv.distribution = .fillEqually
        sv.spacing = 10
        sv.backgroundColor = .clear
        return sv
    }()
    
    lazy var goToVCBtns: [UIButton] = {
        var btnArr = [UIButton]()
        let titleForBtns = ["운동 시작", "운동 설정", "사용 설명"]
        for num in 0...2 {
            let btn = UIButton()
            btn.tag = num
            btn.backgroundColor = Colors().colorArray[num]
            btn.setTitle("\(titleForBtns[num])", for: .normal)
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
        
        backgroundColor = .systemGreen
        
        self.addSubview(stackViewForVCBtns)
        for num in 0...2 {
            stackViewForVCBtns.addArrangedSubview(goToVCBtns[num])
        }
        
        viewLayoutForHomeVC()
    }
    
    required init?(coder: NSCoder) {
        fatalError("뷰 초기화 에러 발생!")
    }
    
    func viewLayoutForHomeVC() {
        stackViewForVCBtns.translatesAutoresizingMaskIntoConstraints = false
        stackViewForVCBtns.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        stackViewForVCBtns.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        stackViewForVCBtns.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5).isActive = true
        stackViewForVCBtns.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.3).isActive = true
    }
}


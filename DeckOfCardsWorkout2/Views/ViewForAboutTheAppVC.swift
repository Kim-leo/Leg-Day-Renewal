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
        sv.spacing = 10
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
            btnArr.append(btn)
        }
        return btnArr
    }()
    
}

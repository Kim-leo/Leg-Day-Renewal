//
//  View.swift
//  DeckOfCardsWorkout2
//
//  Created by 김승현 on 3/5/24.
//

import Foundation
import UIKit

class MyView: UIView {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemGreen
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("뷰 초기화 에러 발생!")
    }
}

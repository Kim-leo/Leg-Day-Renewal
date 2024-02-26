//
//  View.swift
//  DeckOfCardsWorkout
//
//  Created by 김승현 on 2/26/24.
//

import Foundation
import UIKit

extension UIViewController {
    var leftBarBtn: UIBarButtonItem {
        get {
            let btn = UIBarButtonItem(title: "돌아가기", style: .plain, target: self, action: #selector(leftBarBtnTapped(_:)))
            btn.tintColor = .darkGray
            return btn
        }
    }
    
    var rightBarBtn: UIBarButtonItem {
        get {
            let btn = UIBarButtonItem(title: "저장하기", style: .plain, target: self, action: #selector(rightBarBtnTapped(_:)))
            btn.tintColor = .darkGray
            return btn
        }
    }
    
    @objc func leftBarBtnTapped(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func rightBarBtnTapped(_ sender: UIBarButtonItem) {
//        chosenWorkout.spadePart = preChosenSpade
//        chosenWorkout.heartPart = preChosenHeart
//        chosenWorkout.diamondPart = preChosenDiamond
//        chosenWorkout.cloverPart = preChosenClover
        self.navigationController?.popViewController(animated: true)
    }
    
}

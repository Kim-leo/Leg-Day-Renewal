//
//  ExtensionViewController.swift
//  DeckOfCardsWorkout2
//
//  Created by 김승현 on 3/6/24.
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
    
    @objc func leftBarBtnTapped(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    func setupViewLayout(yourView: UIView) {
        yourView.translatesAutoresizingMaskIntoConstraints = false
        yourView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        yourView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        yourView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        yourView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}

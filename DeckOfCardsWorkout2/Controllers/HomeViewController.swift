//
//  ViewController.swift
//  DeckOfCardsWorkout2
//
//  Created by 김승현 on 3/5/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    let myView = MyView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(myView)
        setupViewLayout()
        
    }

    func setupViewLayout() {
        myView.translatesAutoresizingMaskIntoConstraints = false
        myView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        myView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        myView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        myView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}


//
//  StartWorkoutViewController.swift
//  DeckOfCardsWorkout2
//
//  Created by 김승현 on 3/5/24.
//

import UIKit

class StartWorkoutViewController: UIViewController {

    let myView = ViewForStartWorkout()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(myView)
        setupViewLayout(yourView: myView)
    }
    

    

}

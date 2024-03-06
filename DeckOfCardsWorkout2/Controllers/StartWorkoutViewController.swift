//
//  StartWorkoutViewController.swift
//  DeckOfCardsWorkout2
//
//  Created by 김승현 on 3/5/24.
//

import UIKit

class StartWorkoutViewController: UIViewController {

    let myView = ViewForStartWorkout()
    let viewModel = ViewModelForStartWorkoutVC(cardModel: Card())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = self.leftBarBtn
        self.view.addSubview(myView)
        setupViewLayout(yourView: myView)
        
        viewModel.componentsInitialSetting(myView)
        
        myView.nextBtn.addTarget(self, action: #selector(nextBtnTappedAction), for: .touchUpInside)
    }
    

    

}

extension StartWorkoutViewController {
    @objc func nextBtnTappedAction(_ sender: UIButton) {
        viewModel.nextWorkout(myView)
        print(viewModel.emptyArray.count)
    }
}

//
//  AboutTheAppViewController.swift
//  DeckOfCardsWorkout2
//
//  Created by 김승현 on 3/5/24.
//

import UIKit

class AboutTheAppViewController: UIViewController {

    let myView = ViewForAboutTheAppVC()
    var viewModel = ViewModelForAboutTheApp()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "운동 설명"
        self.navigationItem.leftBarButtonItem = self.leftBarBtn
        
        self.view.addSubview(myView)
        setupViewLayout(yourView: myView)
        
        myView.descriptionBtns.map {
            $0.addTarget(self, action: #selector(descriptionBtnTapped), for: .touchUpInside)
        }
        
       
    }
    

}

extension AboutTheAppViewController {
    @objc func descriptionBtnTapped(_ sender: UIButton, tag: Int) {
        viewModel.descriptionBtnsTapped(view: myView, sender)
    }
    
    
}

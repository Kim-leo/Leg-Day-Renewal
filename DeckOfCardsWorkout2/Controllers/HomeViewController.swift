//
//  ViewController.swift
//  DeckOfCardsWorkout2
//
//  Created by 김승현 on 3/5/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    let myView = ViewForHomeVC()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.view.addSubview(myView)
        setupViewLayout(yourView: myView)
        
        myView.goToVCBtns.map { $0.addTarget(self, action: #selector(self.goToVCBtnsTapped), for: .touchUpInside)}
    }

    
}

extension HomeViewController {
    @objc func goToVCBtnsTapped(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            guard let startWorkoutVC = self.storyboard?.instantiateViewController(withIdentifier: "StartWorkoutViewController") as? StartWorkoutViewController else { return }
            self.navigationController?.pushViewController(startWorkoutVC, animated: true)
        case 1:
            guard let setWorkoutVC = self.storyboard?.instantiateViewController(withIdentifier: "SetWorkoutViewController") as? SetWorkoutViewController else { return }
            self.navigationController?.pushViewController(setWorkoutVC, animated: true)
        case 2:
            guard let aboutTheAppVC = self.storyboard?.instantiateViewController(withIdentifier: "AboutTheAppViewController") as? AboutTheAppViewController else { return }
            self.navigationController?.pushViewController(aboutTheAppVC, animated: true)
        default:
            break
        }
    }
}

//
//  ViewController.swift
//  DeckOfCardsWorkout
//
//  Created by 김승현 on 2/23/24.
//

import UIKit

class HomeViewController: UIViewController {

    lazy var startWorkoutVCBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("운동 시작", for: .normal)
        btn.backgroundColor = .black
        btn.setTitleColor(.white, for: .normal)
        return btn
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Home ViewController")
        
        self.view.addSubview(startWorkoutVCBtn)
        startWorkoutVCBtn.addTarget(self, action: #selector(self.startWorkoutVCBtnTapped), for: .touchUpInside)
        startWorkoutBtnLayout()
    }
    

}

extension HomeViewController {
    @objc func startWorkoutVCBtnTapped(_ sender: UIButton) {
        guard let startWorkoutVC = self.storyboard?.instantiateViewController(withIdentifier: "StartWorkoutViewController") as? StartWorkoutViewController else { return }
        self.navigationController?.pushViewController(startWorkoutVC, animated: true)
    }
    
    func startWorkoutBtnLayout() {
        startWorkoutVCBtn.translatesAutoresizingMaskIntoConstraints = false
        startWorkoutVCBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        startWorkoutVCBtn.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        startWorkoutVCBtn.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30).isActive = true
        startWorkoutVCBtn.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30).isActive = true
        startWorkoutVCBtn.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
    }
}

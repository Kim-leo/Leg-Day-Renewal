//
//  ViewController.swift
//  DeckOfCardsWorkout
//
//  Created by 김승현 on 2/23/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - View
    lazy var startWorkoutVCBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("운동 시작", for: .normal)
        btn.backgroundColor = .black
        btn.setTitleColor(.white, for: .normal)
        return btn
    }()
    
    lazy var setWorkoutVCBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("운동 설정", for: .normal)
        btn.backgroundColor = .darkGray
        btn.setTitleColor(.white, for: .normal)
        return btn
    }()
    
//    lazy var stackViewForBtns: UIStackView = {
//        let sv = UIStackView()
//        sv.axis = .vertical
//        sv.alignment = .fill
//        sv.distribution = .fillEqually
//        sv.spacing = 20
//        return sv
//    }()
    
    // MARK: - Parameters
    
    let chosenWorkouts = ChosenWorkouts.shared
    let anyView = AnyView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Home ViewController")
        
        self.view.addSubview(anyView.stackViewVertical)
        [startWorkoutVCBtn, setWorkoutVCBtn].map {
            self.anyView.stackViewVertical.addArrangedSubview($0)
        }
        viewsLayout()
        
        startWorkoutVCBtn.addTarget(self, action: #selector(self.startWorkoutVCBtnTapped), for: .touchUpInside)
        setWorkoutVCBtn.addTarget(self, action: #selector(self.setWorkoutVCBtnTapped), for: .touchUpInside)
        
    }
    

}

extension HomeViewController {
    @objc func startWorkoutVCBtnTapped(_ sender: UIButton) {
        guard let startWorkoutVC = self.storyboard?.instantiateViewController(withIdentifier: "StartWorkoutViewController") as? StartWorkoutViewController else { return }
        self.navigationController?.pushViewController(startWorkoutVC, animated: true)
    }
    
    @objc func setWorkoutVCBtnTapped(_ sender: UIButton) {
        guard let setWorkoutVC = self.storyboard?.instantiateViewController(withIdentifier: "SetWorkoutViewController") as? SetWorkoutViewController else { return }
        self.navigationController?.pushViewController(setWorkoutVC, animated: true)
    }
    
    func viewsLayout() {
        anyView.stackViewVertical.translatesAutoresizingMaskIntoConstraints = false
        anyView.stackViewVertical.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        anyView.stackViewVertical.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50).isActive = true
        anyView.stackViewVertical.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -50).isActive = true
        anyView.stackViewVertical.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
}

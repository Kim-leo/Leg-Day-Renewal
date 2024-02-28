//
//  ViewController.swift
//  DeckOfCardsWorkout
//
//  Created by 김승현 on 2/23/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Parameters
    let chosenWorkouts = ChosenWorkouts.shared
    let viewFile = ViewFile()
    
    override func viewWillAppear(_ animated: Bool) {

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(viewFile.stackViewVertical)
        [viewFile.startWorkoutVCBtn, viewFile.setWorkoutVCBtn].map {
            self.viewFile.stackViewVertical.addArrangedSubview($0)
        }
        viewsLayout()
        
        viewFile.startWorkoutVCBtn.addTarget(self, action: #selector(self.startWorkoutVCBtnTapped), for: .touchUpInside)
        viewFile.setWorkoutVCBtn.addTarget(self, action: #selector(self.setWorkoutVCBtnTapped), for: .touchUpInside)
        
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
        viewFile.stackViewVertical.translatesAutoresizingMaskIntoConstraints = false
        viewFile.stackViewVertical.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        viewFile.stackViewVertical.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50).isActive = true
        viewFile.stackViewVertical.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -50).isActive = true
        viewFile.stackViewVertical.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
}

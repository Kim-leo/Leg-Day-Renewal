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
        
        self.view.addSubview(viewFile.stackViewForVCBtns)

        viewsLayout()

        viewFile.goToVCBtns.map { $0.addTarget(self, action: #selector(self.goToVCBtnsTapped), for: .touchUpInside)}
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
    
//    @objc func startWorkoutVCBtnTapped(_ sender: UIButton) {
//        guard let startWorkoutVC = self.storyboard?.instantiateViewController(withIdentifier: "StartWorkoutViewController") as? StartWorkoutViewController else { return }
//        self.navigationController?.pushViewController(startWorkoutVC, animated: true)
//    }
//    
//    @objc func setWorkoutVCBtnTapped(_ sender: UIButton) {
//        guard let setWorkoutVC = self.storyboard?.instantiateViewController(withIdentifier: "SetWorkoutViewController") as? SetWorkoutViewController else { return }
//        self.navigationController?.pushViewController(setWorkoutVC, animated: true)
//    }
//    
//    @objc func AboutTheAppVCBtnTapped(_ sender: UIButton) {
//        print("Hi")
//    }
    
    func viewsLayout() {
        viewFile.stackViewForVCBtns.translatesAutoresizingMaskIntoConstraints = false
        viewFile.stackViewForVCBtns.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        viewFile.stackViewForVCBtns.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        viewFile.stackViewForVCBtns.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.5).isActive = true
        viewFile.stackViewForVCBtns.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.3).isActive = true
    }
}

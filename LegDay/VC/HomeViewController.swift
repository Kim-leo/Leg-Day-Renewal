//
//  ViewController.swift
//  LegDay
//
//  Created by 김승현 on 2023/01/12.
//

import UIKit

class HomeViewController: UIViewController {
    
    let chosenWorkouts = ChosenWorkouts.shared

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
        print(chosenWorkouts.spadePart ?? "")
        print(chosenWorkouts.heartPart ?? "")
        print(chosenWorkouts.diamondPart ?? "")
        print(chosenWorkouts.cloverPart ?? "")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

   
    
    @IBAction func getStartedBtnTapped(_ sender: UIButton) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "WorkoutViewController") else { return }
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @IBAction func setWorkoutBtnTapped(_ sender: UIButton) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "ChooseWorkoutViewController") else { return }
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @IBAction func aboutTheAppBtnTapped(_ sender: UIButton) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "DescriptionViewController") else { return }
        self.present(nextVC, animated: true)
    }
    
}


//
//  ViewController.swift
//  LegDay
//
//  Created by 김승현 on 2023/01/12.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


    @IBAction func getStartedBtnTapped(_ sender: UIButton) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "WorkoutViewController") else { return }
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}


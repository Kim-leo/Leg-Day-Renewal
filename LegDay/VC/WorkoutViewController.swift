//
//  WorkoutViewController.swift
//  LegDay
//
//  Created by 김승현 on 2023/01/12.
//

import UIKit

class WorkoutViewController: UIViewController {
    // MARK: - 변수, 상수
    let deckOfCard = CardsString()
    
    @IBOutlet weak var outputLabel: UILabel!
    
    
    
    // MARK: - View Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: - 액션 함수
    
    @IBAction func redoBtnTapped(_ sender: UIButton) {
        outputLabel.text = "redo"
    }
    
    @IBAction func nextBtnTapped(_ sender: UIButton) {
        outputLabel.text = "\(deckOfCard.cardArray.randomElement() ?? "")"
    }
}

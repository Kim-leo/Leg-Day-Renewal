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
    @IBOutlet weak var nextBtn: UIButton!
    
    var emptyArray = [String]()
    var pickedCard: String = ""
    
    // MARK: - View Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        componentsInitialSetting()
        
    }
    
    func componentsInitialSetting() {
        outputLabel.text = "Click Start"
        nextBtn.setTitle("Start", for: .normal)
    }
    
    // MARK: - (액션) 함수
    @IBAction func redoBtnTapped(_ sender: UIButton) {
        emptyArray.popLast()
        outputLabel.text = "\(emptyArray.last ?? "")"
        checkBlackOrRed(words: emptyArray.last ?? "")
    }
    
    @IBAction func nextBtnTapped(_ sender: UIButton) {
        nextBtn.setTitle("Next", for: .normal)

        btnTapped()
        print(emptyArray)
    }
    
    func btnTapped() {
        if emptyArray.count < 52 {
            pickedCard = deckOfCard.cardSet.randomElement() ?? ""
            if !emptyArray.contains(pickedCard) {
                emptyArray.append(pickedCard)
                outputLabel.text = "\(pickedCard)"
                checkBlackOrRed(words: pickedCard)
            } else {
                btnTapped()
            }
        } else {
            outputLabel.text = "Done"
            outputLabel.textColor = .systemBlue
        }
    }
    
    func checkBlackOrRed(words: String) {
        if words.hasPrefix("Heart") || words.hasPrefix("Diamond") {
            outputLabel.textColor = .systemRed
        } else {
            outputLabel.textColor = .black
        }
    }
}

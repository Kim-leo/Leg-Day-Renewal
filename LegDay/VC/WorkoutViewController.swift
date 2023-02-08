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
    
    @IBOutlet weak var cardImageView: UIImageView!
    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var workoutLabel: UILabel!
    
    var emptyArray = [String]()
    var pickedCard: String = ""
    var howManyTimesNum: Int = 0
    let chosenWorkout = ChosenWorkouts.shared
    
    // MARK: - View Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
        emptyArray.removeAll()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        componentsInitialSetting()
        
    }
    
    func componentsInitialSetting() {
        outputLabel.text = "Click Start"
        workoutLabel.text = "Let's go."
        nextBtn.setTitle("Start", for: .normal)
        
    }
    
    // MARK: - (액션) 함수
    @IBAction func redoBtnTapped(_ sender: UIButton) {
        emptyArray.popLast()
        pickedCard = emptyArray.last ?? ""
        outputLabel.text = "\(pickedCard)"
        workoutLabel.textColor = .systemBlue
        checkBlackOrRed(words: pickedCard)
        checkWhichWorkout(words: pickedCard)
        
        if pickedCard.isEmpty {
            cardImageView.image = UIImage(named: "Joker")
        } else {
            cardImageView.image = UIImage(named: pickedCard)
        }
        
    }
    
    @IBAction func nextBtnTapped(_ sender: UIButton) {
        nextBtn.setTitle("Next", for: .normal)

        btnTapped()
//        print(emptyArray)
        checkWhichWorkout(words: pickedCard)
    }
    
    func btnTapped() {
        if emptyArray.count < 52 {
            pickedCard = deckOfCard.cardSet.randomElement() ?? ""
            if !emptyArray.contains(pickedCard) {
                emptyArray.append(pickedCard)
                outputLabel.text = "\(pickedCard)"
                checkBlackOrRed(words: pickedCard)
                cardImageView.image = UIImage(named: pickedCard)
            } else {
                btnTapped()
            }
        } else {
            doneWorkout()
        }
    }
    
    func checkBlackOrRed(words: String) {
        if words.hasPrefix("Heart") || words.hasPrefix("Diamond") {
            outputLabel.textColor = .systemRed
        } else {
            outputLabel.textColor = .black
        }
    }
    
    func checkWhichWorkout(words: String) {
        howManyTimesWorkout(words: words)        
        if words.hasPrefix("Spade") {
            workoutLabel.text = "\(chosenWorkout.spadePart ?? "Workout") : \(howManyTimesNum) times"
        } else if words.hasPrefix("Heart") {
            workoutLabel.text = "\(chosenWorkout.heartPart ?? "Workout") : \(howManyTimesNum) times"
        } else if words.hasPrefix("Clover") {
            workoutLabel.text = "\(chosenWorkout.cloverPart ?? "Workout") : \(howManyTimesNum) times"
        } else if words.hasPrefix("Diamond") {
            workoutLabel.text = "\(chosenWorkout.diamondPart ?? "Workout") : \(howManyTimesNum) times"
        } else if words.hasPrefix("Done") {
            workoutLabel.text = "Congratulations"
        } else {
            componentsInitialSetting()
        }
    }
    
    func howManyTimesWorkout(words: String) {
        switch words.lastString {
        case "0":
            howManyTimesNum = 10
        case "J":
            howManyTimesNum = 11
        case "Q":
            howManyTimesNum = 12
        case "K":
            howManyTimesNum = 13
        default:
            howManyTimesNum = Int(pickedCard.lastString) ?? 0
            break
        }
    }
    
    func doneWorkout() {
        pickedCard = "Done"
        outputLabel.text = pickedCard
        outputLabel.textColor = .systemBlue
        cardImageView.image = UIImage(named: "Joker")
//        workoutLabel.text = "Yahoo"
        workoutLabel.textColor = .systemGreen
    }
    
}


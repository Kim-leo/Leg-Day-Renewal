//
//  StartWorkoutViewController.swift
//  DeckOfCardsWorkout
//
//  Created by 김승현 on 2/23/24.
//

import UIKit

class StartWorkoutViewController: UIViewController {

    //MARK: - View    
    lazy var cardImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "Joker")
        return iv
    }()
    
    lazy var cardNameLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textAlignment = .center
        return label
    }()
    
    lazy var workoutNameLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textAlignment = .center
        return label
    }()
    
    lazy var nextBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("다음", for: .normal)
        btn.backgroundColor = .systemBlue
        return btn
    }()
    
    // MARK: - Parameters
    var cards = Cards()
    let chosenWorkout = ChosenWorkouts.shared
    
    // MARK: - View Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
        cards.emptyArray.removeAll()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.leftBarButtonItem = self.leftBarBtn
        
        componentsInitialSetting()
        [cardImageView, cardNameLabel, workoutNameLabel, nextBtn].map {
            self.view.addSubview($0)
        }
        
        viewsLayout()
        
        nextBtn.addTarget(self, action: #selector(self.nextBtnTappedAction), for: .touchUpInside)
        
    }

}

extension StartWorkoutViewController {
    
    // MARK: - Functions
    func componentsInitialSetting() {
        cardNameLabel.text = "시작 버튼 클릭"
        workoutNameLabel.text = "화이팅"
        workoutNameLabel.textColor = .black
        nextBtn.setTitle("운동 시작", for: .normal)
        nextBtn.backgroundColor = .systemBlue
        
    }
    
    @objc func nextBtnTappedAction(_ sender: UIButton) {
        switch sender.currentTitle ?? "" {
            
        case "재시작":
            componentsInitialSetting()
            nextBtn.setTitle("다음", for: .normal)
            
            cards = Cards()
            
            nextBtnTapped()
            checkWhichWorkout(words: cards.pickedCard)
        default:
            nextBtn.setTitle("다음", for: .normal)
            nextBtnTapped()
            
            
            break
        }
        
    }
    
    func nextBtnTapped() {
        switch cards.emptyArray.count {
        case 52:
            doneWorkout()
            break
        default:
            cards.pickedCard = cards.cardSet.randomElement() ?? ""
            checkBlackOrRed(words: cards.pickedCard)
            checkWhichWorkout(words: cards.pickedCard)
            cardNameLabel.text = cards.pickedCard
            cardImageView.image = UIImage(named: cards.pickedCard)
                
            cards.cardSet.remove(cards.pickedCard)
            cards.emptyArray.append(cards.pickedCard)
            
        }
    }
    
    func checkBlackOrRed(words: String) {
        if words.hasPrefix("Heart") || words.hasPrefix("Diamond") {
            cardNameLabel.textColor = .systemRed
        } else {
            cardNameLabel.textColor = .black
        }
    }
    
    func checkWhichWorkout(words: String) {
        howManyTimesWorkout(words: words)
        if words.hasPrefix("Spade") {
            workoutNameLabel.text = "\(chosenWorkout.spadePart ?? "Workout") : \(chosenWorkout.howManyTimesNum) times"
        } else if words.hasPrefix("Heart") {
            workoutNameLabel.text = "\(chosenWorkout.heartPart ?? "Workout") : \(chosenWorkout.howManyTimesNum) times"
        } else if words.hasPrefix("Clover") {
            workoutNameLabel.text = "\(chosenWorkout.cloverPart ?? "Workout") : \(chosenWorkout.howManyTimesNum) times"
        } else if words.hasPrefix("Diamond") {
            workoutNameLabel.text = "\(chosenWorkout.diamondPart ?? "Workout") : \(chosenWorkout.howManyTimesNum) times"
        } else if words.hasPrefix("운동") {
            workoutNameLabel.text = "축하해요~"
        } else {
            componentsInitialSetting()
        }
    }
    
    func howManyTimesWorkout(words: String) {
        switch words.lastString {
        case "0":
            chosenWorkout.howManyTimesNum = 10
        case "J":
            chosenWorkout.howManyTimesNum = 11
        case "Q":
            chosenWorkout.howManyTimesNum = 12
        case "K":
            chosenWorkout.howManyTimesNum = 13
        default:
            chosenWorkout.howManyTimesNum = Int(cards.pickedCard.lastString) ?? 0
            break
        }
    }
    
    func doneWorkout() {
        cardImageView.image = UIImage(named: "Joker")
        cardNameLabel.text = "운동 끝!"
        cardNameLabel.textColor = .systemBlue
        workoutNameLabel.text = "축하해요~"
        workoutNameLabel.textColor = .systemGreen
        nextBtn.setTitle("재시작", for: .normal)
        nextBtn.backgroundColor = .black
        
    }
    
    
    // MARK: - UI Components Auto Layout
    func viewsLayout() {
        cardImageView.translatesAutoresizingMaskIntoConstraints = false
        cardImageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100).isActive = true
        cardImageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 100).isActive = true
        cardImageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -100).isActive = true
        cardImageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
    
        cardNameLabel.translatesAutoresizingMaskIntoConstraints = false
        cardNameLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        cardNameLabel.topAnchor.constraint(equalTo: cardImageView.bottomAnchor, constant: 10).isActive = true
        cardNameLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50).isActive = true
        cardNameLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -50).isActive = true
        cardNameLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    
        workoutNameLabel.translatesAutoresizingMaskIntoConstraints = false
        workoutNameLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        workoutNameLabel.topAnchor.constraint(equalTo: cardNameLabel.bottomAnchor, constant: 10).isActive = true
        workoutNameLabel.leadingAnchor.constraint(equalTo: cardNameLabel.leadingAnchor).isActive = true
        workoutNameLabel.trailingAnchor.constraint(equalTo: cardNameLabel.trailingAnchor).isActive = true
        workoutNameLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    
        nextBtn.translatesAutoresizingMaskIntoConstraints = false
        nextBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        nextBtn.topAnchor.constraint(equalTo: workoutNameLabel.bottomAnchor, constant: 50).isActive = true
        nextBtn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        nextBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}

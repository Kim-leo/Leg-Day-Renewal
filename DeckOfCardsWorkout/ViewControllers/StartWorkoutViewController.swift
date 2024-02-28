//
//  StartWorkoutViewController.swift
//  DeckOfCardsWorkout
//
//  Created by 김승현 on 2/23/24.
//

import UIKit

class StartWorkoutViewController: UIViewController {

    //MARK: - View    
//    lazy var cardImageView: UIImageView = {
//        let iv = UIImageView()
//        iv.contentMode = .scaleAspectFit
//        iv.image = UIImage(named: "Joker")
//        return iv
//    }()
//    
//    lazy var cardNameLabel: UILabel = {
//        let label = UILabel()
//        label.text = ""
//        label.textAlignment = .center
//        return label
//    }()
//    
//    lazy var workoutNameLabel: UILabel = {
//        let label = UILabel()
//        label.text = ""
//        label.textAlignment = .center
//        return label
//    }()
//    
//    lazy var nextBtn: UIButton = {
//        let btn = UIButton()
//        btn.setTitle("다음", for: .normal)
//        btn.backgroundColor = .systemBlue
//        return btn
//    }()
    
    // MARK: - Parameters
    var cards = Cards()
    let chosenWorkout = ChosenWorkouts.shared
    let viewFile = ViewFile()
    
    // MARK: - View Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
        cards.emptyArray.removeAll()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.leftBarButtonItem = self.leftBarBtn
        
        componentsInitialSetting()
        [viewFile.cardImageView, viewFile.cardNameLabel, viewFile.workoutNameLabel, viewFile.nextBtn].map {
            self.view.addSubview($0)
        }
        
        viewsLayout()
        
        viewFile.nextBtn.addTarget(self, action: #selector(self.nextBtnTappedAction), for: .touchUpInside)
        
    }

}

extension StartWorkoutViewController {
    
    // MARK: - Functions
    func componentsInitialSetting() {
        viewFile.cardNameLabel.text = "시작 버튼 클릭"
        viewFile.workoutNameLabel.text = "화이팅"
        viewFile.workoutNameLabel.textColor = .black
        viewFile.nextBtn.setTitle("운동 시작", for: .normal)
        viewFile.nextBtn.backgroundColor = .systemBlue
        
    }
    
    @objc func nextBtnTappedAction(_ sender: UIButton) {
        switch sender.currentTitle ?? "" {
            
        case "재시작":
            componentsInitialSetting()
            viewFile.nextBtn.setTitle("다음", for: .normal)
            
            cards = Cards()
            
            nextBtnTapped()
            checkWhichWorkout(words: cards.pickedCard)
        default:
            viewFile.nextBtn.setTitle("다음", for: .normal)
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
            viewFile.cardNameLabel.text = cards.pickedCard
            viewFile.cardImageView.image = UIImage(named: cards.pickedCard)
                
            cards.cardSet.remove(cards.pickedCard)
            cards.emptyArray.append(cards.pickedCard)
            
        }
    }
    
    func checkBlackOrRed(words: String) {
        if words.hasPrefix("Heart") || words.hasPrefix("Diamond") {
            viewFile.cardNameLabel.textColor = .systemRed
        } else {
            viewFile.cardNameLabel.textColor = .black
        }
    }
    
    func checkWhichWorkout(words: String) {
        howManyTimesWorkout(words: words)
        if words.hasPrefix("Spade") {
            viewFile.workoutNameLabel.text = "\(chosenWorkout.selectedWorkoutPerPokerShapeArray[0]) : \(chosenWorkout.howManyTimesNum) times"
        } else if words.hasPrefix("Heart") {
            viewFile.workoutNameLabel.text = "\(chosenWorkout.selectedWorkoutPerPokerShapeArray[1]) : \(chosenWorkout.howManyTimesNum) times"
        } else if words.hasPrefix("Clover") {
            viewFile.workoutNameLabel.text = "\(chosenWorkout.selectedWorkoutPerPokerShapeArray[2]) : \(chosenWorkout.howManyTimesNum) times"
        } else if words.hasPrefix("Diamond") {
            viewFile.workoutNameLabel.text = "\(chosenWorkout.selectedWorkoutPerPokerShapeArray[3]) : \(chosenWorkout.howManyTimesNum) times"
        } else if words.hasPrefix("운동") {
            viewFile.workoutNameLabel.text = "축하해요~"
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
        viewFile.cardImageView.image = UIImage(named: "Joker")
        viewFile.cardNameLabel.text = "운동 끝!"
        viewFile.cardNameLabel.textColor = .systemBlue
        viewFile.workoutNameLabel.text = "축하해요~"
        viewFile.workoutNameLabel.textColor = .systemGreen
        viewFile.nextBtn.setTitle("재시작", for: .normal)
        viewFile.nextBtn.backgroundColor = .black
        
    }
    
    
    // MARK: - UI Components Auto Layout
    func viewsLayout() {
        viewFile.cardImageView.translatesAutoresizingMaskIntoConstraints = false
        viewFile.cardImageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100).isActive = true
        viewFile.cardImageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 100).isActive = true
        viewFile.cardImageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -100).isActive = true
        viewFile.cardImageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
    
        viewFile.cardNameLabel.translatesAutoresizingMaskIntoConstraints = false
        viewFile.cardNameLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        viewFile.cardNameLabel.topAnchor.constraint(equalTo: viewFile.cardImageView.bottomAnchor, constant: 10).isActive = true
        viewFile.cardNameLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50).isActive = true
        viewFile.cardNameLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -50).isActive = true
        viewFile.cardNameLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    
        viewFile.workoutNameLabel.translatesAutoresizingMaskIntoConstraints = false
        viewFile.workoutNameLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        viewFile.workoutNameLabel.topAnchor.constraint(equalTo: viewFile.cardNameLabel.bottomAnchor, constant: 10).isActive = true
        viewFile.workoutNameLabel.leadingAnchor.constraint(equalTo: viewFile.cardNameLabel.leadingAnchor).isActive = true
        viewFile.workoutNameLabel.trailingAnchor.constraint(equalTo: viewFile.cardNameLabel.trailingAnchor).isActive = true
        viewFile.workoutNameLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    
        viewFile.nextBtn.translatesAutoresizingMaskIntoConstraints = false
        viewFile.nextBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        viewFile.nextBtn.topAnchor.constraint(equalTo: viewFile.workoutNameLabel.bottomAnchor, constant: 50).isActive = true
        viewFile.nextBtn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        viewFile.nextBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}

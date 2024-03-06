//
//  ViewModel.swift
//  DeckOfCardsWorkout2
//
//  Created by 김승현 on 3/6/24.
//

import Foundation
import UIKit
import Combine

//final class Observable<T> {
//    typealias Listener = (T) -> Void
//    var listener: Listener?
//    var value: T {
//        didSet {
//            listener?(value)
//        }
//    }
//    
//    init(_ value: T) {
//        self.value = value
//    }
//    
//    func bind(listener: Listener?) {
//        self.listener = listener
//        listener?(value)
//    }
//}



// MARK: - HomeVC View Model
class ViewModelForHomeVC: UIViewController {
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
    
}

// MARK: - StartWorkoutVC View Model
class ViewModelForStartWorkoutVC {
    let cardModel: Card
    
    let cardSet: Set<String> = ["Spade 1", "Spade 2", "Spade 3", "Spade 4", "Spade 5", "Spade 6", "Spade 7", "Spade 8", "Spade 9", "Spade 10", "Spade J", "Spade Q", "Spade K", "Heart 1", "Heart 2", "Heart 3", "Heart 4", "Heart 5", "Heart 6", "Heart 7", "Heart 8", "Heart 9", "Heart 10", "Heart J", "Heart Q", "Heart K", "Clover 1", "Clover 2", "Clover 3", "Clover 4", "Clover 5", "Clover 6", "Clover 7", "Clover 8", "Clover 9", "Clover 10", "Clover J", "Clover Q", "Clover K", "Diamond 1", "Diamond 2", "Diamond 3", "Diamond 4", "Diamond 5", "Diamond 6", "Diamond 7", "Diamond 8", "Diamond 9", "Diamond 10", "Diamond J", "Diamond Q", "Diamond K"
    ]
    
    var cardSetCopy: Set<String> = ["Spade 1", "Spade 2", "Spade 3", "Spade 4", "Spade 5", "Spade 6", "Spade 7", "Spade 8", "Spade 9", "Spade 10", "Spade J", "Spade Q", "Spade K", "Heart 1", "Heart 2", "Heart 3", "Heart 4", "Heart 5", "Heart 6", "Heart 7", "Heart 8", "Heart 9", "Heart 10", "Heart J", "Heart Q", "Heart K", "Clover 1", "Clover 2", "Clover 3", "Clover 4", "Clover 5", "Clover 6", "Clover 7", "Clover 8", "Clover 9", "Clover 10", "Clover J", "Clover Q", "Clover K", "Diamond 1", "Diamond 2", "Diamond 3", "Diamond 4", "Diamond 5", "Diamond 6", "Diamond 7", "Diamond 8", "Diamond 9", "Diamond 10", "Diamond J", "Diamond Q", "Diamond K"
    ]
    
    var emptyArray = [String]()
    var pickedCard: String = ""
    
    init(cardModel: Card) {
        self.cardModel = Card()
    }
    
    
    
    
    
}

extension ViewModelForStartWorkoutVC {
    
    
    func componentsInitialSetting(_ view: ViewForStartWorkout) {
        view.cardNameLabel.text = "운동 시작 클릭!"
        view.workoutNameLabel.text = "화이팅"
        view.workoutNameLabel.textColor = .black
        view.nextBtn.setTitle("운동 시작", for: .normal)
        view.nextBtn.backgroundColor = .systemBlue
        
    }
    
    func nextWorkout(_ view: ViewForStartWorkout) {
        switch view.nextBtn.currentTitle ?? "" {
        case "재시작":
            componentsInitialSetting(view)
            view.nextBtn.setTitle("다음", for: .normal)
            
            emptyArray.removeAll()
            cardSetCopy = cardSet
            
            pickOneCard(view)
        default:
            
            
            view.nextBtn.setTitle("다음", for: .normal)
            pickOneCard(view)
            
            cardSetCopy.remove(pickedCard)
            emptyArray.append(pickedCard)
            break
        }
    }
    
    func pickOneCard(_ view: ViewForStartWorkout) {
        switch emptyArray.count {
        case 52:
            view.cardImageView.image = UIImage(named: "Joker")
            view.cardNameLabel.text = "운동 끝!"
            view.cardNameLabel.textColor = .systemBlue
            view.workoutNameLabel.text = "축하해요~"
            view.workoutNameLabel.textColor = .systemGreen
            view.nextBtn.setTitle("재시작", for: .normal)
            view.nextBtn.backgroundColor = .black
            
        default:
            pickedCard = cardSetCopy.randomElement() ?? ""
            
            view.cardNameLabel.text = pickedCard
            view.cardImageView.image = UIImage(named: pickedCard)
        }
    }
    
    
    
}

// MARK: - SetWorkoutVC View Model

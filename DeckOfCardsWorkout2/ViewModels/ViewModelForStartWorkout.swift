//
//  ViewModelForStartWorkout.swift
//  DeckOfCardsWorkout2
//
//  Created by 김승현 on 3/8/24.
//

import Foundation
import UIKit
import Combine

class ViewModelForStartWorkoutVC {
    let cardModel: CardModel
//    var workoutModel = WorkoutModel.shared
    let workoutModel: WorkoutModel
    var cardSet = CardModel().cardSet
    var emptyArray = [String]()
    var pickedCard: String = ""
    
    init(cardModel: CardModel, workoutModel: WorkoutModel) {
        self.cardModel = CardModel()
        self.workoutModel = WorkoutModel()
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
            cardSet = CardModel().cardSet
            pickOneCard(view)
            checkWhichWorkout(words: pickedCard, view: view)
        default:
            view.nextBtn.setTitle("다음", for: .normal)
            pickOneCard(view)
            
            cardSet.remove(pickedCard)
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
            break
        default:
            pickedCard = cardSet.randomElement() ?? ""
            
            if pickedCard.hasPrefix("Heart") || pickedCard.hasPrefix("Diamond") {
                view.cardNameLabel.textColor = .systemRed
            } else {
                view.cardNameLabel.textColor = .black
            }
            checkWhichWorkout(words: pickedCard, view: view)
            
            view.cardNameLabel.text = pickedCard
            view.cardImageView.image = UIImage(named: pickedCard)
        }
    }
    
    func checkWhichWorkout(words: String, view: ViewForStartWorkout) {
         howManyTimesWorkout(words: words)
        if words.hasPrefix("Spade") {
            view.workoutNameLabel.text = "\(workoutModel.selectedWorkoutPerPokerShapeArray[0]) : \(workoutModel.howManyTimesNum) times"
        } else if words.hasPrefix("Heart") {
            view.workoutNameLabel.text = "\(workoutModel.selectedWorkoutPerPokerShapeArray[1]) : \(workoutModel.howManyTimesNum) times"
        } else if words.hasPrefix("Clover") {
            view.workoutNameLabel.text = "\(workoutModel.selectedWorkoutPerPokerShapeArray[2]) : \(workoutModel.howManyTimesNum) times"
        } else if words.hasPrefix("Diamond") {
            view.workoutNameLabel.text = "\(workoutModel.selectedWorkoutPerPokerShapeArray[3]) : \(workoutModel.howManyTimesNum) times"
        } else if words.hasPrefix("운동") {
            view.workoutNameLabel.text = "축하해요~"
        } else {
            componentsInitialSetting(view)
        }
    }
    
    func howManyTimesWorkout(words: String) {
        switch words.lastString {
        case "0":
            workoutModel.howManyTimesNum = 10
        case "J":
            workoutModel.howManyTimesNum = 11
        case "Q":
            workoutModel.howManyTimesNum = 12
        case "K":
            workoutModel.howManyTimesNum = 13
        default:
            workoutModel.howManyTimesNum = Int(pickedCard.lastString) ?? 0
            break
        }
    }
}

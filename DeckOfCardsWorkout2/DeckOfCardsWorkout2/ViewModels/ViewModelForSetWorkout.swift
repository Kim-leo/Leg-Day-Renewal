//
//  ViewModelForSetWorkout.swift
//  DeckOfCardsWorkout2
//
//  Created by 김승현 on 3/8/24.
//

import Foundation
import UIKit
import Combine

class ViewModelForSetWorkoutVC {
    static let shared = ViewModelForSetWorkoutVC(workoutMode: WorkoutModel())
    
    var workoutModel = WorkoutModel()
    var myWorkoutModel = MyWorkout.shared
    
    var selectedWorkoutPerPokerShapeArray = ["운동 1", "운동 2", "운동 3", "운동 4"]
    var typeOfWorkouts: [String] = ["전체", "상체", "하체", "맨몸", "유산소", "스트레칭"]
    var yourAllWorkoutsArray: [String] = ["+ 직접 입력"]
    
    var workoutForCategories: [[String]] = [
        [],
        ["이두", "삼두", "가슴근육", "복근", "딥스"],
        ["스쿼트", "오른쪽 런지", "왼쪽 런지", "마운틴 클라이머"],
        ["버피테스트", "턱걸이", "푸쉬업", "크런치", "플랭크"],
        ["러닝", "사이클"],
        ["팔 스트레칭", "다리 스트레칭", "가슴 스트레칭"],
    ]
    
    var whichWorkout = ""
    var inputWorkout = ""
    
    init(workoutMode: WorkoutModel) {
        self.workoutModel = WorkoutModel()
    }
    
    
    
}

extension ViewModelForSetWorkoutVC {
    func initialSetting(view: ViewForSetWorkoutVC) {
        if yourAllWorkoutsArray.count == 1 {
            yourAllWorkoutsArray += Array(workoutForCategories.joined())
            workoutModel.originalWorkouts = yourAllWorkoutsArray
        }
        
        view.categoryBtns.map {
            $0.setTitle("\(typeOfWorkouts[$0.tag])", for: .normal)
        }
        
    }
    
    func addWorkoutByYourself(view: ViewForSetWorkoutVC, vc: SetWorkoutViewController) {
        let alert = UIAlertController(title: "추가하기", message: "수행하고 싶은 운동을 직접 추가합니다.", preferredStyle: .alert)
        alert.addTextField{ (myTextField) in
            myTextField.placeholder = "입력하기"
            myTextField.autocorrectionType = .no
            myTextField.spellCheckingType = .no
        }
        let okAction = UIAlertAction(title: "카테고리 지정", style: .default) { [self] (ok) in
            inputWorkout = alert.textFields?[0].text ?? ""
            view.lowerCollectinView.alpha = 0.5
            view.stackViewVertical.alpha = 1
            vc.view.bringSubviewToFront(view.stackViewVertical)
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel) { (cancel) in }
        alert.addAction(okAction)
        alert.addAction(cancel)
        vc.present(alert, animated: true, completion: nil)
    }
    
    func categoryBtnTapped(view: ViewForSetWorkoutVC) {
        view.stackViewVertical.alpha = 0
        view.lowerCollectinView.alpha = 1
        
//        viewFile.lowerCollectinView.reloadData()
        view.lowerCollectinView.performBatchUpdates {
            view.lowerCollectinView.insertItems(at: [IndexPath(item: 1, section: 0)])
            yourAllWorkoutsArray.insert(inputWorkout, at: 1)
        } completion: { [weak self] _ in
        }
        workoutModel.originalWorkouts.append(inputWorkout)
        print(workoutModel.originalWorkouts)
    }
    
    func cancelBtnTapped(view: ViewForSetWorkoutVC) {
        inputWorkout = ""
        view.stackViewVertical.alpha = 0
        view.lowerCollectinView.alpha = 1
    }
    
    func pokerCardBtnTapped(view: ViewForSetWorkoutVC, _ sender: UIButton) {
        view.verticalStackViewForSettingPokerShapes.alpha = 0
        view.lowerCollectinView.alpha = 1
        
        selectedWorkoutPerPokerShapeArray[sender.tag] = whichWorkout
        myWorkoutModel.selectedWorkoutPerPokerShapeArray[sender.tag] = whichWorkout
        
    }
}

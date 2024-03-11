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
    let workoutModel: WorkoutModel
    
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
    
    init(workoutMode: WorkoutModel) {
        self.workoutModel = WorkoutModel()
    }
    
    
    
}

extension ViewModelForSetWorkoutVC {
    func initialSetting() {
        if yourAllWorkoutsArray.count == 1 {
            yourAllWorkoutsArray += Array(workoutForCategories.joined())
            workoutModel.originalWorkouts = yourAllWorkoutsArray
        }
    }
    
    
    
}

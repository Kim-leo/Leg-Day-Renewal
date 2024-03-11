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
    
    init(workoutMode: WorkoutModel) {
        self.workoutModel = WorkoutModel()
    }
    
    
    
}

extension ViewModelForSetWorkoutVC {
    func initialSetting() {
        if yourAllWorkoutsArray.count == 1 {
            yourAllWorkoutsArray += Array(workoutModel.workoutForCategories.joined())
            workoutModel.originalWorkouts = yourAllWorkoutsArray
        }
    }
    
    
}

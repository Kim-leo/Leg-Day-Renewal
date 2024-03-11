//
//  WorkoutModel.swift
//  DeckOfCardsWorkout2
//
//  Created by 김승현 on 3/7/24.
//

import Foundation

class WorkoutModel {
//    static let shared = WorkoutModel()
    
    var selectedWorkoutPerPokerShapeArray = ["운동 1", "운동 2", "운동 3", "운동 4"]
    var howManyTimesNum: Int = 0
    
    var workoutForCategories: [[String]] = [
        [],
        ["이두", "삼두", "가슴근육", "복근", "딥스"],
        ["스쿼트", "오른쪽 런지", "왼쪽 런지", "마운틴 클라이머"],
        ["버피테스트", "턱걸이", "푸쉬업", "크런치", "플랭크"],
        ["러닝", "사이클"],
        ["팔 스트레칭", "다리 스트레칭", "가슴 스트레칭"],
    ]
    var originalWorkouts: [String] = []
    
    
    
}

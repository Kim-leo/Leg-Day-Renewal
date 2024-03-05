//
//  WorkoutData.swift
//  LegDay
//
//  Created by 김승현 on 2023/01/24.
//

import Foundation

struct WorkoutSorting {
    var workouts: [String] = ["+ 직접 입력", "턱걸이", "딥스", "푸쉬업", "스쿼트", "윗몸 일으키기", "버피", "브릿지", "마운틴 클라이머", "바이시클 메뉴버"]
    var typeOfWorkouts: [String] = ["전체", "상체", "하체", "맨몸", "유산소", "스트레칭"]
    var categoryArrays: [[String]] = [
        [],
        ["이두", "삼두", "가슴근육", "복근", "딥스"],
        ["스쿼트", "오른쪽 런지", "왼쪽 런지", "마운틴 클라이머"],
        ["버피테스트", "턱걸이", "푸쉬업", "크런치", "플랭크"],
        ["러닝", "사이클"],
        ["팔 스트레칭", "다리 스트레칭", "가슴 스트레칭"],
    ]
    
    
    
    let sampleData: [String] = ["운동 1", "운동 2", "운동 3", "운동 4", "운동 5", "운동 6", "운동 7", "운동 8", "운동 9", "운동 10", "운동 11", "운동 12", "운동 13", "운동 14", "운동 15", "운동 16", "운동 17", "운동 18"]
}

class ChosenWorkouts {
    static let shared = ChosenWorkouts()
    
    var spadePart: String?
    var heartPart: String?
    var cloverPart: String?
    var diamondPart: String?
    
    var yourWorkoutArray: [String] = ["+ 직접 입력", "턱걸이", "딥스", "푸쉬업", "스쿼트", "윗몸 일으키기", "버피", "브릿지", "마운틴 클라이머", "바이시클 메뉴버"]
    
    var yourAllWorkoutsArray: [String] = ["+ 직접 입력"]
    
    var workoutForCategories: [[String]] = [
        [],
        ["이두", "삼두", "가슴근육", "복근", "딥스"],
        ["스쿼트", "오른쪽 런지", "왼쪽 런지", "마운틴 클라이머"],
        ["버피테스트", "턱걸이", "푸쉬업", "크런치", "플랭크"],
        ["러닝", "사이클"],
        ["팔 스트레칭", "다리 스트레칭", "가슴 스트레칭"],
    ]
    
    private init() {}
}

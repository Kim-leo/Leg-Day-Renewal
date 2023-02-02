//
//  WorkoutData.swift
//  LegDay
//
//  Created by 김승현 on 2023/01/24.
//

import Foundation

struct WorkoutSorting {
    var workouts: [String] = ["+", "턱걸이", "딥스", "푸쉬업", "스쿼트", "윗몸 일으키기", "버피", "브릿지", "마운틴 클라이머", "바이시클 메뉴버"]
    let sampleData: [String] = ["운동 1", "운동 2", "운동 3", "운동 4", "운동 5", "운동 6", "운동 7", "운동 8", "운동 9", "운동 10", "운동 11", "운동 12", "운동 13", "운동 14", "운동 15", "운동 16", "운동 17", "운동 18"]
}

class ChosenWorkouts {
    static let shared = ChosenWorkouts()
    
    var spadePart: String?
    var heartPart: String?
    var cloverPart: String?
    var diamondPart: String?
    
    private init() {}
}

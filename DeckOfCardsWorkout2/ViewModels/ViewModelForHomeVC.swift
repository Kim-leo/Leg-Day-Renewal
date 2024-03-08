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


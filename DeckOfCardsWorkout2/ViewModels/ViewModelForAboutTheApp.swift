//
//  ViewModelForAboutTheApp.swift
//  DeckOfCardsWorkout2
//
//  Created by 김승현 on 3/14/24.
//

import Foundation
import UIKit

class ViewModelForAboutTheApp {
    
}

extension ViewModelForAboutTheApp {
    func descriptionBtnsTapped(view: ViewForAboutTheAppVC, _ sender: UIButton) {
        switch sender.tag {
        case 0:
            print("first")
            
        case 1:
            print("second")
        case 2:
            print("third")
        default:
            break
        }
    }
}

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
    func descriptionBtnsTapped(view: ViewForAboutTheAppVC) {
        view.backgroundView.alpha = 1
    }
    
    func xBtnTapped(view: ViewForAboutTheAppVC) {
        view.backgroundView.alpha = 0
    }
}

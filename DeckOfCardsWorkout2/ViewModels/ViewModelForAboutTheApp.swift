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
        view.backgroundViews[sender.tag].alpha = 1
    }
    
    func xBtnTapped(view: ViewForAboutTheAppVC, _ sender: UIButton) {
        view.backgroundViews[sender.tag].alpha = 0
    }
}

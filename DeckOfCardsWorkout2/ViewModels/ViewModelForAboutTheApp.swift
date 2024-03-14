//
//  ViewModelForAboutTheApp.swift
//  DeckOfCardsWorkout2
//
//  Created by 김승현 on 3/14/24.
//

import Foundation
import UIKit

class ViewModelForAboutTheApp {
    var chosenBtnTag: Int = 0
}

extension ViewModelForAboutTheApp {
    func descriptionBtnsTapped(view: ViewForAboutTheAppVC, _ sender: UIButton) {
        view.backgroundView.alpha = 1
        
        chosenBtnTag = sender.tag
        
        view.descripTionCollectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .left, animated: false)
    }
    
    func xBtnTapped(view: ViewForAboutTheAppVC) {
        view.backgroundView.alpha = 0
    }
    
    func leftBtnTapped(view: ViewForAboutTheAppVC) {
        print("left")
    }
    
    func rightBtnTapped(view: ViewForAboutTheAppVC) {
        print("right")
    }
    
    
}

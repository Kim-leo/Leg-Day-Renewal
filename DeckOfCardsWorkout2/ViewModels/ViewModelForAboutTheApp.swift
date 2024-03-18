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
    
    let screenImageName = [
        ["운동설명", "운동설명2"],
        ["운동설정", "운동설정2", "운동설정3", "운동설정4", "운동설정5", "운동설정6", "운동설정7"],
        ["운동시작", "운동시작2", "운동시작3"]
    ]
    
}

extension ViewModelForAboutTheApp {
    func descriptionBtnsTapped(view: ViewForAboutTheAppVC, _ sender: UIButton) {
        view.backgroundView.alpha = 1
        
        chosenBtnTag = sender.tag
        
        view.descripTionCollectionView.reloadData()
        view.descripTionCollectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .left, animated: false)
    }
    
    func xBtnTapped(view: ViewForAboutTheAppVC) {
        view.backgroundView.alpha = 0
    }
    
    func leftBtnTapped(view: ViewForAboutTheAppVC) {
        print("left")
        view.descripTionCollectionView.scrollToItem(at: IndexPath(item: view.pageControBar.currentPage - 1, section: 0), at: .left, animated: true)
    }
    
    func rightBtnTapped(view: ViewForAboutTheAppVC) {
        print("right")
        if view.pageControBar.currentPage != 5 - 1 {
            view.descripTionCollectionView.scrollToItem(at: IndexPath(item: view.pageControBar.currentPage + 1, section: 0), at: .right, animated: true)
        }
        
    }
    
    
    
}


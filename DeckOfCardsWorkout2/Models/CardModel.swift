//
//  CardModel.swift
//  DeckOfCardsWorkout2
//
//  Created by 김승현 on 3/6/24.
//

import Foundation

class Card {
    enum pokerShape {
        case spade
        case diamond
        case heart
        case clover
    }
    
    let cardName: String
    let myWorkout: String
    
    init(cardName: String = "카드", myWorkout: String = "Joker") {
        self.cardName = cardName
        self.myWorkout = myWorkout
    }
    
    
    
}

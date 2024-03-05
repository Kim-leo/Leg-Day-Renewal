//
//  Extensions.swift
//  DeckOfCardsWorkout
//
//  Created by 김승현 on 2/23/24.
//

import Foundation
import UIKit

extension UIView {
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            return layer.borderWidth = newValue
        }
    }
    
    var borderColor: UIColor? {
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
    }
}

extension String {
    var lastString: String {
        get {
            if self.isEmpty { return self }
            let lastIndex = self.index(before: self.endIndex)
            return String(self[lastIndex])
        }
    }
}

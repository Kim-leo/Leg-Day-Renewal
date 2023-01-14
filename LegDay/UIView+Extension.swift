//
//  UIView+Extension.swift
//  LegDay
//
//  Created by 김승현 on 2023/01/12.
//

import Foundation
import UIKit

// MARK: - UIView
extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            return layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
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

// MARK: - UILabel
extension UILabel {
    func boldSpecificString(targetString: String) {
        let fontSize = self.font.pointSize
        let font = UIFont.boldSystemFont(ofSize: fontSize)
        let fullText = self.text ?? ""
        let range = (fullText as NSString).range(of: targetString)
        let attributedString = NSMutableAttributedString(string: fullText)
        attributedString.addAttribute(.font, value: font, range: range)
        self.attributedText = attributedString
    }
}

// MARK: - ViewController
extension UIViewController {
    func rotatePickerView(pv: UIPickerView) {
        let y = pv.frame.origin.y
        let x = pv.frame.origin.x
        
        pv.transform = CGAffineTransform(rotationAngle: -90 * (.pi / 180))
        pv.frame = CGRect(x: x, y: y, width: pv.frame.height, height: pv.frame.width)
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

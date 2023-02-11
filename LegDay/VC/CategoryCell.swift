//
//  CategoryCell.swift
//  LegDay
//
//  Created by 김승현 on 2023/02/07.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    
    @IBOutlet weak var categoryLabel: UILabel!
    
    override var isSelected: Bool {
//        didSet {
//            if isSelected {
//                backgroundColor = .lightGray
//            } else {
//                backgroundColor = .white
//            }
//        }
        willSet {
            if newValue {
                self.categoryLabel.backgroundColor = .lightGray
                self.categoryLabel.textColor = .black
            } else {
                self.categoryLabel.backgroundColor = .white
            }
        }
    }
    
    func configure(number: Int) {
        self.isSelected = true
    }
}

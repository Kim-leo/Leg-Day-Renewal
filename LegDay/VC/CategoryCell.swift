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
        didSet {
            if isSelected {
                backgroundColor = .lightGray
            } else {
                backgroundColor = .white
            }
        }
    }
}

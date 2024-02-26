//
//  LowerCell.swift
//  DeckOfCardsWorkout
//
//  Created by 김승현 on 2/26/24.
//

import UIKit

class LowerCell: UICollectionViewCell {
    
    weak var parent = SetWorkoutViewController()
    
    lazy var typesOfWorkoutLabel: UILabel = {
        let label = UILabel()
        label.layer.cornerRadius = 10
        label.clipsToBounds = true
        label.layer.borderColor = UIColor.darkGray.cgColor
        label.layer.borderWidth = 1
        label.backgroundColor = .lightGray
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(typesOfWorkoutLabel)
        setupLayoutForUpperCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupLayoutForUpperCell() {
        typesOfWorkoutLabel.translatesAutoresizingMaskIntoConstraints = false
        typesOfWorkoutLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
        typesOfWorkoutLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        typesOfWorkoutLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
        typesOfWorkoutLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
        
    }

}

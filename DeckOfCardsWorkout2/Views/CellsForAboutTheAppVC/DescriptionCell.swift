//
//  Description1Cell.swift
//  DeckOfCardsWorkout2
//
//  Created by 김승현 on 3/14/24.
//

import UIKit

class DescriptionCell: UICollectionViewCell {
    lazy var screenImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "운동설명")
        
        return iv
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.backgroundColor = nil
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(screenImageView)
        setupLayoutForDescriptionCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayoutForDescriptionCell() {
        screenImageView.translatesAutoresizingMaskIntoConstraints = false
        screenImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
        screenImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        screenImageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
        screenImageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
        
    }

}

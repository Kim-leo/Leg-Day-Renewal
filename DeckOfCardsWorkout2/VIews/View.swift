//
//  View.swift
//  DeckOfCardsWorkout2
//
//  Created by 김승현 on 3/5/24.
//

import Foundation
import UIKit

// MARK: - HomeVC View
class ViewForHomeVC: UIView {
    lazy var stackViewForVCBtns: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.alignment = .fill
        sv.distribution = .fillEqually
        sv.spacing = 10
        sv.backgroundColor = .clear
        return sv
    }()
    
    lazy var goToVCBtns: [UIButton] = {
        var btnArr = [UIButton]()
        let titleForBtns = ["운동 시작", "운동 설정", "사용 설명"]
        for num in 0...2 {
            let btn = UIButton()
            btn.tag = num
            btn.backgroundColor = Colors().colorArray[num]
            btn.setTitle("\(titleForBtns[num])", for: .normal)
            btn.setTitleColor(.darkGray, for: .normal)
            btn.tintColor = .white
            btn.layer.cornerRadius = 10
            btn.clipsToBounds = true
            btn.layer.borderColor = UIColor.darkGray.cgColor
            btn.layer.borderWidth = 1
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
            btnArr.append(btn)
        }
        return btnArr
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemGreen
        
        self.addSubview(stackViewForVCBtns)
        for num in 0...2 {
            stackViewForVCBtns.addArrangedSubview(goToVCBtns[num])
        }
        
        viewLayoutForHomeVC()
    }
    
    required init?(coder: NSCoder) {
        fatalError("뷰 초기화 에러 발생!")
    }
    
    func viewLayoutForHomeVC() {
        stackViewForVCBtns.translatesAutoresizingMaskIntoConstraints = false
        stackViewForVCBtns.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        stackViewForVCBtns.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        stackViewForVCBtns.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5).isActive = true
        stackViewForVCBtns.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.3).isActive = true
    }
}

// MARK: - StartWorkoutVC View
class ViewForStartWorkout: UIView {
    lazy var cardImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "Joker")
        return iv
    }()
    
    lazy var cardNameLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textAlignment = .center
        return label
    }()
    
    lazy var workoutNameLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textAlignment = .center
        return label
    }()
    
    lazy var nextBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("다음", for: .normal)
        btn.backgroundColor = .systemBlue
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        [cardImageView, cardNameLabel, workoutNameLabel, nextBtn].map {
            self.addSubview($0)
        }
        
        viewLayoutForStartWorkoutVC()
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("뷰 초기화 에러 발생!")
    }
    
    func viewLayoutForStartWorkoutVC() {
        cardImageView.translatesAutoresizingMaskIntoConstraints = false
        cardImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 100).isActive = true
        cardImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 100).isActive = true
        cardImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -100).isActive = true
        cardImageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
    
        cardNameLabel.translatesAutoresizingMaskIntoConstraints = false
        cardNameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        cardNameLabel.topAnchor.constraint(equalTo: cardImageView.bottomAnchor, constant: 10).isActive = true
        cardNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 50).isActive = true
        cardNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50).isActive = true
        cardNameLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    
        workoutNameLabel.translatesAutoresizingMaskIntoConstraints = false
        workoutNameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        workoutNameLabel.topAnchor.constraint(equalTo: cardNameLabel.bottomAnchor, constant: 10).isActive = true
        workoutNameLabel.leadingAnchor.constraint(equalTo: cardNameLabel.leadingAnchor).isActive = true
        workoutNameLabel.trailingAnchor.constraint(equalTo: cardNameLabel.trailingAnchor).isActive = true
        workoutNameLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    
        nextBtn.translatesAutoresizingMaskIntoConstraints = false
        nextBtn.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        nextBtn.topAnchor.constraint(equalTo: workoutNameLabel.bottomAnchor, constant: 50).isActive = true
        nextBtn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        nextBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}

// MARK: - SetWorkoutVC View
class ViewForSetWorkoutVC: UIView {
    lazy var stackViewVertical: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.alignment = .fill
        sv.distribution = .fillEqually
        sv.spacing = 10
        sv.backgroundColor = .clear
        return sv
    }()
    
    lazy var upperView: UIView = {
        let v = UIView()
        v.backgroundColor = .systemGray6
        return v
    }()
    
    lazy var upperCollectinView: UICollectionView = {
        let layout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 50
        layout.footerReferenceSize = .zero
        layout.headerReferenceSize = .zero
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.tag = 0
        cv.isPagingEnabled = true
        cv.showsHorizontalScrollIndicator = true
        cv.backgroundColor = .clear
//        cv.register(UpperCell.self, forCellWithReuseIdentifier: "UpperCell")
        return cv
    }()
    
    lazy var lowerView: UIView = {
        let v = UIView()
        return v
    }()
    
    lazy var lowerCollectinView: UICollectionView = {
        let layout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        layout.footerReferenceSize = .zero
        layout.headerReferenceSize = .zero
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.tag = 1
        cv.isPagingEnabled = true
        cv.showsVerticalScrollIndicator = true
//        cv.register(LowerCell.self, forCellWithReuseIdentifier: "LowerCell")
        cv.backgroundColor = .clear
        return cv
    }()
    
    lazy var stackViewHorizontal1: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.alignment = .fill
        sv.distribution = .fillEqually
        sv.spacing = 10
        return sv
    }()
    
    lazy var stackViewHorizontal2: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.alignment = .fill
        sv.distribution = .fillEqually
        sv.spacing = 10
        return sv
    }()
    
    lazy var categoryBtns: [UIButton] = {
        var btnArr = [UIButton]()
        for num in 0...5 {
            let btn = UIButton()
            btn.tag = num
            btn.backgroundColor = .white
            btn.setTitle("\(btn.tag)", for: .normal)
            btn.setTitleColor(.darkGray, for: .normal)
            btn.tintColor = .white
            btn.layer.cornerRadius = 15
            btn.clipsToBounds = true
            btn.layer.borderColor = UIColor.darkGray.cgColor
            btn.layer.borderWidth = 1
            btnArr.append(btn)
        }
        return btnArr
    }()
    
    lazy var cancelBtnView: UIView = {
        let v = UIView()
        return v
    }()
    
    lazy var cancelBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("X", for: .normal)
        btn.setTitleColor(.darkGray, for: .normal)
        btn.backgroundColor = . white
        btn.layer.cornerRadius = 15
        btn.clipsToBounds = true
        btn.layer.borderColor = UIColor.darkGray.cgColor
        btn.layer.borderWidth = 1
        return btn
    }()
    
    lazy var verticalStackViewForSettingPokerShapes: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.alignment = .fill
        sv.distribution = .fillEqually
        sv.spacing = 10
        sv.backgroundColor = .clear
        return sv
    }()
    
    lazy var stackViewHorizontal3: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.alignment = .fill
        sv.distribution = .fillEqually
        sv.spacing = 10
        return sv
    }()
    
    lazy var stackViewHorizontal4: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.alignment = .fill
        sv.distribution = .fillEqually
        sv.spacing = 10
        return sv
    }()
    
    lazy var pokerShapeBtns: [UIButton] = {
        var btnArr = [UIButton]()
        let pokerShapeImages = ["suit.spade.fill", "diamond.fill", "heart.fill", "suit.club.fill"]
        for num in 0...3 {
            let btn = UIButton()
            btn.tag = num
            btn.backgroundColor = .white
            btn.setBackgroundImage(UIImage(systemName: pokerShapeImages[num]), for: .normal)
            btn.setTitle("+", for: .normal)
            btn.setTitleColor(.white, for: .normal)
            btn.tintColor = (num % 3 == 0) ? .black : .red
            btn.layer.cornerRadius = 15
            btn.clipsToBounds = true
            btn.layer.borderColor = UIColor.darkGray.cgColor
            btn.layer.borderWidth = 1
            btnArr.append(btn)
        }
        return btnArr
    }()
}

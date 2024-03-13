//
//  ViewForAboutTheAppVC.swift
//  DeckOfCardsWorkout2
//
//  Created by 김승현 on 3/8/24.
//

import Foundation
import UIKit

class ViewForAboutTheAppVC: UIView {
    lazy var stackViewFor3Btns: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.alignment = .fill
        sv.distribution = .fillEqually
        sv.spacing = 20
        sv.backgroundColor = .clear
        return sv
    }()
    
    lazy var descriptionBtns: [UIButton] = {
        var btnArr = [UIButton]()
        let btnTitleArr = ["운동 설명", "운동 시작", "운동 설정"]
        for num in 0...2 {
            let btn = UIButton()
            btn.tag = num
            btn.setTitle("\(btnTitleArr[num])", for: .normal)
            btn.backgroundColor = Colors().colorArray.randomElement()
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
    
    lazy var descripTion1CollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
//        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        layout.footerReferenceSize = .zero
        layout.headerReferenceSize = .zero
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.tag = 0
        cv.isScrollEnabled = true
        cv.isPagingEnabled = true
        cv.showsHorizontalScrollIndicator = false
        cv.register(Description1Cell.self, forCellWithReuseIdentifier: "Description1Cell")
        return cv
    }()
    
    lazy var descripTion2CollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
//        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        layout.footerReferenceSize = .zero
        layout.headerReferenceSize = .zero
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.tag = 1
        cv.isScrollEnabled = true
        cv.isPagingEnabled = true
        cv.showsHorizontalScrollIndicator = false
        cv.register(Description2Cell.self, forCellWithReuseIdentifier: "Description2Cell")
        return cv
    }()
    
    lazy var descripTion3CollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
//        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        layout.footerReferenceSize = .zero
        layout.headerReferenceSize = .zero
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.tag = 2
        cv.isScrollEnabled = true
        cv.isPagingEnabled = true
        cv.showsHorizontalScrollIndicator = false
        cv.register(Description3Cell.self, forCellWithReuseIdentifier: "Description3Cell")
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        [stackViewFor3Btns, descripTion1CollectionView, descripTion2CollectionView, descripTion3CollectionView].map {
            self.addSubview($0)
        }
        
        descriptionBtns.map {
            stackViewFor3Btns.addArrangedSubview($0)
        }
        
        descripTion1CollectionView.alpha = 1
        descripTion2CollectionView.alpha = 0
        descripTion3CollectionView.alpha = 0
        
        viewLayoutForAboutTheAppVC()
    }
    
    required init?(coder: NSCoder) {
        fatalError("뷰 초기화 에러 발생!")
    }
    
    func viewLayoutForAboutTheAppVC() {
        stackViewFor3Btns.translatesAutoresizingMaskIntoConstraints = false
        stackViewFor3Btns.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        stackViewFor3Btns.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        stackViewFor3Btns.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5).isActive = true
        stackViewFor3Btns.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.4).isActive = true
        
        descripTion1CollectionView.translatesAutoresizingMaskIntoConstraints = false
        descripTion1CollectionView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        descripTion1CollectionView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        descripTion1CollectionView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8).isActive = true
        descripTion1CollectionView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.8).isActive = true
        
        descripTion2CollectionView.translatesAutoresizingMaskIntoConstraints = false
        descripTion2CollectionView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        descripTion2CollectionView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        descripTion2CollectionView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8).isActive = true
        descripTion2CollectionView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.8).isActive = true
        
        descripTion3CollectionView.translatesAutoresizingMaskIntoConstraints = false
        descripTion3CollectionView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        descripTion3CollectionView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        descripTion3CollectionView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8).isActive = true
        descripTion3CollectionView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.8).isActive = true
    }
    
}

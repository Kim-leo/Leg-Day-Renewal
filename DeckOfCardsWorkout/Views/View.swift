//
//  View.swift
//  DeckOfCardsWorkout
//
//  Created by 김승현 on 2/26/24.
//

import Foundation
import UIKit

extension UIViewController {
    var leftBarBtn: UIBarButtonItem {
        get {
            let btn = UIBarButtonItem(title: "돌아가기", style: .plain, target: self, action: #selector(leftBarBtnTapped(_:)))
            btn.tintColor = .darkGray
            return btn
        }
    }
    

    
    @objc func leftBarBtnTapped(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    
}

class AnyView: UIView {
    static let identifier = "anyView"
    
    
    // MARK: - SetWorkoutVC View
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
        cv.register(UpperCell.self, forCellWithReuseIdentifier: "UpperCell")
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
        cv.register(LowerCell.self, forCellWithReuseIdentifier: "LowerCell")
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
//            btn.setImage(UIImage(systemName: pokerShapeImages[num]), for: .normal)
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
    
    
    // MARK: - initializing
    override init(frame: CGRect) {
        super.init(frame: frame)
        settingUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)

    }
    
    private func settingUI() {        
        for num in 0...2 {
            stackViewHorizontal1.addArrangedSubview(categoryBtns[num])
            stackViewHorizontal2.addArrangedSubview(categoryBtns[num + 3])
        }
        
        [stackViewHorizontal3, stackViewHorizontal4].map {
            verticalStackViewForSettingPokerShapes.addArrangedSubview($0)
        }
        
        for num in 0...1 {
            stackViewHorizontal3.addArrangedSubview(pokerShapeBtns[num])
            stackViewHorizontal4.addArrangedSubview(pokerShapeBtns[num + 2])
        }
        
        cancelBtnView.addSubview(cancelBtn)
    }
    
}

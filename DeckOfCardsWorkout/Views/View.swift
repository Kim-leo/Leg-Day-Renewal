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
    
    var rightBarBtn: UIBarButtonItem {
        get {
            let btn = UIBarButtonItem(title: "저장하기", style: .plain, target: self, action: #selector(rightBarBtnTapped(_:)))
            btn.tintColor = .darkGray
            return btn
        }
    }
    
    @objc func leftBarBtnTapped(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func rightBarBtnTapped(_ sender: UIBarButtonItem) {
//        chosenWorkout.spadePart = preChosenSpade
//        chosenWorkout.heartPart = preChosenHeart
//        chosenWorkout.diamondPart = preChosenDiamond
//        chosenWorkout.cloverPart = preChosenClover
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
}

class AnyView: UIView {
    static let identifier = "anyView"
    
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
        
        cancelBtnView.addSubview(cancelBtn)
    }
    
}

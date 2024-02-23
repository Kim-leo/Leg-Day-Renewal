//
//  StartWorkoutViewController.swift
//  DeckOfCardsWorkout
//
//  Created by 김승현 on 2/23/24.
//

import UIKit

class StartWorkoutViewController: UIViewController {

    //MARK: - View
    lazy var cardImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "Joker")
        return iv
    }()
    
    lazy var cardNameLabel: UILabel = {
        let label = UILabel()
        label.text = "운동 시작"
        label.textAlignment = .center
        return label
    }()
    
    lazy var nextBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("다음", for: .normal)
        btn.backgroundColor = .systemBlue
        return btn
    }()
    
    // MARK: - Parameters
    var cards = Cards()
   
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(cardImageView)
        self.view.addSubview(cardNameLabel)
        self.view.addSubview(nextBtn)
        cardImageViewLayout()
        cardNameLabelLayout()
        nextBtnLayout()
        
        nextBtn.addTarget(self, action: #selector(self.nextBtnTappedAction), for: .touchUpInside)
        
    }

}

extension StartWorkoutViewController {
    
    // MARK: - Functions
    @objc func nextBtnTappedAction(_ sender: UIButton) {
        switch sender.currentTitle ?? "" {
        case "운동 끝!":
            nextBtn.setTitle("재시작", for: .normal)
        case "재시작":
            nextBtn.setTitle("다음", for: .normal)
            
            cards = Cards()
            
            nextBtnTapped()
        default:
            nextBtnTapped()
            break
        }
        
    }
    
    func nextBtnTapped() {
        switch cards.emptyArray.count {
        case 52:
            cardImageView.image = UIImage(named: "Joker")
            cardNameLabel.text = "운동 끝!"
            
            nextBtn.setTitle("재시작", for: .normal)
            break
        default:
            cards.pickedCard = cards.cardSet.randomElement() ?? ""
            
            cardNameLabel.text = cards.pickedCard
            cardImageView.image = UIImage(named: cards.pickedCard)
                
            cards.cardSet.remove(cards.pickedCard)
            cards.emptyArray.append(cards.pickedCard)
        }
    }
    
    
    // MARK: - UI Components Auto Layout
    func cardImageViewLayout() {
        cardImageView.translatesAutoresizingMaskIntoConstraints = false
        cardImageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100).isActive = true
        cardImageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 100).isActive = true
        cardImageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -100).isActive = true
        cardImageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
    }
    
    func cardNameLabelLayout() {
        cardNameLabel.translatesAutoresizingMaskIntoConstraints = false
        cardNameLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        cardNameLabel.topAnchor.constraint(equalTo: cardImageView.bottomAnchor, constant: 50).isActive = true
        cardNameLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50).isActive = true
        cardNameLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -50).isActive = true
        cardNameLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    
    
    func nextBtnLayout() {
        nextBtn.translatesAutoresizingMaskIntoConstraints = false
        nextBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        nextBtn.topAnchor.constraint(equalTo: cardNameLabel.bottomAnchor, constant: 50).isActive = true
        nextBtn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        nextBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
}

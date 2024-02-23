//
//  StartWorkoutViewController.swift
//  DeckOfCardsWorkout
//
//  Created by 김승현 on 2/23/24.
//

import UIKit

class StartWorkoutViewController: UIViewController {

    var deckOfCards = Cards().cardSet
    var sampleData = SampleData().datas
    var emptyArray = [String]()
    var pickedCard: String = ""
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(cardImageView)
        self.view.addSubview(cardNameLabel)
        
        self.view.addSubview(nextBtn)

        nextBtn.addTarget(self, action: #selector(self.nextBtnTappedAction), for: .touchUpInside)
        cardImageViewLayout()
        cardNameLabelLayout()
        
        nextBtnLayout()
    }

}

extension StartWorkoutViewController {
    @objc func nextBtnTappedAction(_ sender: UIButton) {
        switch sender.currentTitle ?? "" {
        case "운동 끝!":
            nextBtn.setTitle("재시작", for: .normal)
        case "재시작":
            nextBtn.setTitle("다음", for: .normal)
            
            deckOfCards = Cards().cardSet
            emptyArray.removeAll()
            pickedCard = ""
            
            nextBtnTapped()
        default:
            nextBtnTapped()
            break
        }
        
    }
    
    func nextBtnTapped() {
        switch emptyArray.count {
        case 52:
            cardImageView.image = UIImage(named: "Joker")
            cardNameLabel.text = "운동 끝!"
            
            nextBtn.setTitle("재시작", for: .normal)
            break
        default:
            pickedCard = deckOfCards.randomElement() ?? ""
            
            cardNameLabel.text = pickedCard
            cardImageView.image = UIImage(named: pickedCard)
                
            deckOfCards.remove(pickedCard)
            emptyArray.append(pickedCard)
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

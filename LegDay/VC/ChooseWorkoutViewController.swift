//
//  ChooseWorkoutViewController.swift
//  LegDay
//
//  Created by 김승현 on 2023/01/24.
//

import UIKit

class ChooseWorkoutViewController: UIViewController {
    
    // MARK: - Variables
    lazy var leftBarBtn: UIBarButtonItem = {
        let btn = UIBarButtonItem(title: "돌아가기", style: .plain, target: self, action: #selector(leftBarBtnTapped(_:)))
        btn.tintColor = .darkGray
        return btn
    }()
    
    lazy var rightBarBtn: UIBarButtonItem = {
        let btn = UIBarButtonItem(title: "저장하기", style: .plain, target: self, action: #selector(rightBarBtnTapped(_:)))
        btn.tintColor = .darkGray
        return btn
    }()
    
    @IBOutlet weak var cellTabView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet var cardBtns: [UIButton]!
    
    

    let workoutData = WorkoutSorting()
    
    let shapeOfCards = ["Spade", "Heart", "Diamond", "Clover"]
    
    // MARK: - View Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.leftBarButtonItem = self.leftBarBtn
        self.navigationItem.rightBarButtonItem = self.rightBarBtn

        cellTabView.alpha = 0
        
    }
    
   
    
    
    // MARK: - Functions
    @objc func leftBarBtnTapped(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func rightBarBtnTapped(_ sender: UIBarButtonItem) {
        print("Tapped")
    }
    
    
    @IBAction func cardBtnsTapped(_ sender: UIButton) {
        print(sender.currentTitle ?? "")
        cellTabView.alpha = 0
        collectionView.alpha = 1
        
        
    }
    
   
    

}

// MARK: - CollectionView Extensions
extension ChooseWorkoutViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return workoutData.sampleData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? ListCell else { return UICollectionViewCell() }
        cell.cellLabel.text = workoutData.sampleData[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(workoutData.sampleData[indexPath.row])
        collectionView.alpha = 0.5
        cellTabView.alpha = 1
        self.view.bringSubviewToFront(cellTabView)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 3 - 5
        return CGSize(width: width, height: width)
    }
    
    
}


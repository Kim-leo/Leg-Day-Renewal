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
    
    

    var workoutData = WorkoutSorting()
    var chosenWorkout = ChosenWorkouts.shared
    
    var preChosenSpade: String?
    var preChosenHeart: String?
    var preChosenDiamond: String?
    var preChosenClover: String?
    
    var preChosenWorkoutArray = ["", "", "", ""]
    
    var whichWorkout: String = ""
    
    // MARK: - View Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
//        cardBtns[0].setTitle(chosenWorkout.spadePart ?? "+", for: .normal)
//        cardBtns[1].setTitle(chosenWorkout.heartPart ?? "+", for: .normal)
//        cardBtns[2].setTitle(chosenWorkout.diamondPart ?? "+", for: .normal)
//        cardBtns[3].setTitle(chosenWorkout.cloverPart ?? "+", for: .normal)
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
        chosenWorkout.spadePart = preChosenSpade
        chosenWorkout.heartPart = preChosenHeart
        chosenWorkout.diamondPart = preChosenDiamond
        chosenWorkout.cloverPart = preChosenClover
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func cardBtnsTapped(_ sender: UIButton) {
        cellTabView.alpha = 0
        collectionView.alpha = 1
        
        sender.setTitle(whichWorkout, for: .normal)
        switch sender.tag  {
        case 0:
            preChosenSpade = sender.currentTitle ?? ""
        case 1:
            preChosenHeart = sender.currentTitle ?? ""
        case 2:
            preChosenDiamond = sender.currentTitle ?? ""
        case 3:
            preChosenClover = sender.currentTitle ?? ""
        default:
            break
        }
        
    }
    
   
    

}

// MARK: - CollectionView Extensions
extension ChooseWorkoutViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
//        return workoutData.workouts.count
        return chosenWorkout.yourWorkoutArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? ListCell else { return UICollectionViewCell() }
        
        
//        cell.cellLabel.text = workoutData.workouts[indexPath.row]
        cell.cellLabel.text = chosenWorkout.yourWorkoutArray[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        print(workoutData.sampleData[indexPath.row])
        
        switch workoutData.workouts[indexPath.row] {
        case "+ 직접 입력":
            let alert = UIAlertController(title: "추가하기", message: "수행하고 싶은 운동을 직접 추가합니다.", preferredStyle: .alert)
            alert.addTextField{ (myTextField) in
                myTextField.placeholder = "입력하기"
            }
            let okAction = UIAlertAction(title: "Okay", style: .default) { [self] (ok) in
//                print(alert.textFields?[0].text ?? "")
                collectionView.performBatchUpdates {
                    chosenWorkout.yourWorkoutArray.insert(alert.textFields?[0].text ?? "", at: 1)
                    self.collectionView.insertItems(at: [IndexPath(item: 1, section: 0)])
                } completion: { [weak self] _ in
                    print(self?.collectionView.numberOfItems(inSection: 0))
                }
            }
            let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (cancel) in }
            alert.addAction(okAction)
            alert.addAction(cancel)
            self.present(alert, animated: true, completion: nil)
            
        default:
            collectionView.alpha = 0.5
            cellTabView.alpha = 1
            self.view.bringSubviewToFront(cellTabView)
//            whichWorkout = workoutData.workouts[indexPath.row]
            whichWorkout = chosenWorkout.yourWorkoutArray[indexPath.row]
        }
        
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


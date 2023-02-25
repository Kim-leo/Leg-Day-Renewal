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
    @IBOutlet weak var upperView: UIView!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var chooseCategoryView: UIView!
    @IBOutlet var categoryBtns: [UIButton]!
    @IBOutlet weak var cancelChoosingCategoryBtn: UIButton!
    
    

    var workoutData = WorkoutSorting()
    var chosenWorkout = ChosenWorkouts.shared
    var colors = Colors()
    
    var preChosenSpade: String?
    var preChosenHeart: String?
    var preChosenDiamond: String?
    var preChosenClover: String?
    
    var preChosenWorkoutArray = ["", "", "", ""]
    
    var whichWorkout: String = ""
    var inputWorkout: String = ""
    
    var joinedCategory = Array(WorkoutSorting().categoryArrays.joined())
    
    // MARK: - View Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
//        cardBtns[0].setTitle(chosenWorkout.spadePart ?? "+", for: .normal)
//        cardBtns[1].setTitle(chosenWorkout.heartPart ?? "+", for: .normal)
//        cardBtns[2].setTitle(chosenWorkout.diamondPart ?? "+", for: .normal)
//        cardBtns[3].setTitle(chosenWorkout.cloverPart ?? "+", for: .normal)
        categoryCollectionView.tag = 1
        collectionView.tag = 2
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.leftBarButtonItem = self.leftBarBtn
        self.navigationItem.rightBarButtonItem = self.rightBarBtn

        cellTabView.alpha = 0
        
        
//        chosenWorkout.yourAllWorkoutsArray += Array(workoutData.categoryArrays.joined())
        chosenWorkout.yourAllWorkoutsArray += Array(chosenWorkout.workoutForCategories.joined())
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
    
    @IBAction func chooseCategoryBtnsTapped(_ sender: UIButton) {
        chooseCategoryView.alpha = 0
        collectionView.alpha = 1
        
        chosenWorkout.workoutForCategories[sender.tag].append(inputWorkout)
        chosenWorkout.yourAllWorkoutsArray.append(inputWorkout)
        
        collectionView.performBatchUpdates {
        chosenWorkout.yourAllWorkoutsArray.insert(inputWorkout, at: 1)
        self.collectionView.insertItems(at: [IndexPath(item: 1, section: 0)])
        } completion: { [weak self] _ in
        }
        
        print("workoutForCategories: \(chosenWorkout.workoutForCategories)")
    }
    
    @IBAction func cancelChoosingCategoryBtnTapped(_ sender: UIButton) {
        chooseCategoryView.alpha = 0
        collectionView.alpha = 1
    }
    
   
    

}

// MARK: - CollectionView Extensions
extension ChooseWorkoutViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView.tag {
        case 1:
            return workoutData.typeOfWorkouts.count
        case 2:
            return chosenWorkout.yourAllWorkoutsArray.count
//            return joinedCategory.count
        default:
            return 0
            break
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView.tag {
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as? CategoryCell else { return UICollectionViewCell() }
//            cell.categoryLabel.text = workoutData.typeOfWorkouts[indexPath.row]
            cell.categoryLabel.text = workoutData.typeOfWorkouts[indexPath.row]
            cell.categoryLabel.backgroundColor = .white
            cell.categoryLabel.textColor = .darkGray
            return cell
        case 2:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? ListCell else { return UICollectionViewCell() }
//            cell.cellLabel.text = chosenWorkout.yourWorkoutArray[indexPath.row]
            cell.cellLabel.text = chosenWorkout.yourAllWorkoutsArray[indexPath.row]
            cell.cellLabel.backgroundColor = colors.colorArray[Int(arc4random_uniform(UInt32(colors.colorArray.count)))]
            return cell
        default:
            return UICollectionViewCell()
            break
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView.tag {
        case 1:
            print(workoutData.typeOfWorkouts[indexPath.row])    // 상체
            print(workoutData.categoryArrays[indexPath.row])    // 이두, 삼두 ,,,,
            
            if workoutData.typeOfWorkouts[indexPath.row] == "전체" {
                collectionView.performBatchUpdates {
                    chosenWorkout.yourAllWorkoutsArray.removeAll()
                    chosenWorkout.yourAllWorkoutsArray.append("+ 직접 입력")
//                    chosenWorkout.yourAllWorkoutsArray += Array(workoutData.categoryArrays.joined())
                    chosenWorkout.yourAllWorkoutsArray += Array(chosenWorkout.workoutForCategories.joined())
                    
                    self.collectionView.reloadData()
                    
                }
            } else {
                collectionView.performBatchUpdates {
                    chosenWorkout.yourAllWorkoutsArray.removeAll()
//                    chosenWorkout.yourAllWorkoutsArray += workoutData.categoryArrays[indexPath.row]
                    chosenWorkout.yourAllWorkoutsArray += Array(chosenWorkout.workoutForCategories[indexPath.row])
                    
                    self.collectionView.reloadData()
                    
                }
            }
        case 2:
            switch chosenWorkout.yourAllWorkoutsArray[indexPath.row] {
            case "+ 직접 입력":
                let alert = UIAlertController(title: "추가하기", message: "수행하고 싶은 운동을 직접 추가합니다.", preferredStyle: .alert)
                alert.addTextField{ (myTextField) in
                    myTextField.placeholder = "입력하기"
                }
                let okAction = UIAlertAction(title: "카테고리 지정", style: .default) { [self] (ok) in
                    // 카테고리 지정하는 뷰 띄우기
                    collectionView.alpha = 0.5
                    chooseCategoryView.alpha = 1
                    self.view.bringSubviewToFront(chooseCategoryView)
                    inputWorkout = alert.textFields?[0].text ?? ""
                    print(inputWorkout ?? "")
//                    print(alert.textFields?[0].text ?? "")
//                    collectionView.performBatchUpdates {
//                        chosenWorkout.yourAllWorkoutsArray.insert(alert.textFields?[0].text ?? "", at: 1)
//                        self.collectionView.insertItems(at: [IndexPath(item: 1, section: 0)])
//                    } completion: { [weak self] _ in
//                    }
                }
                let cancel = UIAlertAction(title: "취소", style: .cancel) { (cancel) in }
                alert.addAction(okAction)
                alert.addAction(cancel)
                self.present(alert, animated: true, completion: nil)
            default:
                collectionView.alpha = 0.5
                cellTabView.alpha = 1
                self.view.bringSubviewToFront(cellTabView)
                whichWorkout = chosenWorkout.yourAllWorkoutsArray[indexPath.row]
            }
        default:
            break
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        switch collectionView.tag {
        case 1:
            return 10
        case 2:
            return 5
        default:
            return 0
            break
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        switch collectionView.tag {
        case 1:
            return 50
        case 2:
            return 5
        default:
            return 0
            break
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView.tag {
        case 1:
            let width = categoryCollectionView.frame.width / 4
            let height = categoryCollectionView.frame.height
            return CGSize(width: width, height: height)
        case 2:
            let width = collectionView.frame.width / 3 - 5
            return CGSize(width: width, height: width)
        default:
            return CGSize()
            break
        }
    }
}


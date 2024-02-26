//
//  SetWorkoutViewController.swift
//  DeckOfCardsWorkout
//
//  Created by 김승현 on 2/25/24.
//

import UIKit

class SetWorkoutViewController: UIViewController {

    // MARK: - View
    
    
    // MARK: - Parameters
    
    let workoutSorting = WorkoutSorting()
    let chosenWorkouts = ChosenWorkouts.shared
    let anyView = AnyView()
    
    var inputWorkout: String = ""
    
    // MARK: - View Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.leftBarButtonItem = self.leftBarBtn
        self.navigationItem.rightBarButtonItem = self.rightBarBtn
        
        setupUI()
        viewsLayout()
        
        chosenWorkouts.yourAllWorkoutsArray += Array(chosenWorkouts.workoutForCategories.joined())
    }
    
}

// MARK: - CollectionView Extension
extension SetWorkoutViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView.tag {
        case 0:
            return workoutSorting.typeOfWorkouts.count
        case 1:
            return chosenWorkouts.yourAllWorkoutsArray.count
        default:
            return 0
            break
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView.tag {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UpperCell", for: indexPath) as? UpperCell else { return UICollectionViewCell() }
            cell.parent = self
            cell.typesOfWorkoutLabel.text = workoutSorting.typeOfWorkouts[indexPath.row]
            
            return cell
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LowerCell", for: indexPath) as? LowerCell else { return UICollectionViewCell() }
            cell.parent = self
            cell.typesOfWorkoutLabel.text = chosenWorkouts.yourAllWorkoutsArray[indexPath.row]
            return cell
        default:
            return UICollectionViewCell()
            break
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView.tag {
        case 0:
            let width = anyView.upperCollectinView.frame.width / 4
            let height = anyView.upperCollectinView.frame.height
            return CGSize(width: width, height: height)
        case 1:
            let width = collectionView.frame.width / 3 - 5
            return CGSize(width: width, height: width)
        default:
            return CGSize()
            break
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView.tag {
        case 0:
            collectionView.performBatchUpdates {
                chosenWorkouts.yourAllWorkoutsArray.removeAll()
                if workoutSorting.typeOfWorkouts[indexPath.row] == "전체" {
                    chosenWorkouts.yourAllWorkoutsArray.append("+ 직접 입력")
                    chosenWorkouts.yourAllWorkoutsArray += Array(chosenWorkouts.workoutForCategories.joined())
                } else {
                    chosenWorkouts.yourAllWorkoutsArray += Array(chosenWorkouts.workoutForCategories[indexPath.row])
                }
                anyView.lowerCollectinView.reloadData()
            }
        case 1:
            switch chosenWorkouts.yourAllWorkoutsArray[indexPath.row] {
            case "+ 직접 입력":
                let alert = UIAlertController(title: "추가하기", message: "수행하고 싶은 운동을 직접 추가합니다.", preferredStyle: .alert)
                alert.addTextField{ (myTextField) in
                    myTextField.placeholder = "입력하기"
                }
                let okAction = UIAlertAction(title: "카테고리 지정", style: .default) { [self] (ok) in
                    // 카테고리 지정하는 뷰 띄우기
                    anyView.lowerCollectinView.alpha = 0.5
                    anyView.stackViewVertical.alpha = 1
                    self.view.bringSubviewToFront(anyView.stackViewVertical)
                    inputWorkout = alert.textFields?[0].text ?? ""
                }
                let cancel = UIAlertAction(title: "취소", style: .cancel) { (cancel) in }
                alert.addAction(okAction)
                alert.addAction(cancel)
                self.present(alert, animated: true, completion: nil)
            default:
                collectionView.alpha = 0.5
//                cellTabView.alpha = 1
//                self.view.bringSubviewToFront(cellTabView)
//                whichWorkout = chosenWorkouts.yourAllWorkoutsArray[indexPath.row]
            }
        default:
            break
        }
    }
}


// MARK: - View Layout
extension SetWorkoutViewController {
    func setupUI() {
        [anyView.upperView, anyView.lowerView, anyView.stackViewVertical].map {
            self.view.addSubview($0)
        }
        
        [anyView.stackViewHorizontal1, anyView.stackViewHorizontal2, anyView.cancelBtnView].map {
            anyView.stackViewVertical.addArrangedSubview($0)
        }

        anyView.upperView.addSubview(anyView.upperCollectinView)
        anyView.lowerView.addSubview(anyView.lowerCollectinView)
        
        anyView.upperCollectinView.delegate = self
        anyView.upperCollectinView.dataSource = self
        anyView.lowerCollectinView.delegate = self
        anyView.lowerCollectinView.dataSource = self
        
        anyView.stackViewVertical.alpha = 0
    }
    
    func viewsLayout() {
        anyView.upperView.translatesAutoresizingMaskIntoConstraints = false
        anyView.upperView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        anyView.upperView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        .isActive = true
        anyView.upperView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        anyView.upperView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        anyView.upperCollectinView.translatesAutoresizingMaskIntoConstraints = false
        anyView.upperCollectinView.topAnchor.constraint(equalTo: anyView.upperView.topAnchor).isActive = true
        anyView.upperCollectinView.leadingAnchor.constraint(equalTo: anyView.upperView.leadingAnchor).isActive = true
        anyView.upperCollectinView.trailingAnchor.constraint(equalTo: anyView.upperView.trailingAnchor).isActive = true
        anyView.upperCollectinView.bottomAnchor.constraint(equalTo: anyView.upperView.bottomAnchor).isActive = true
        
        anyView.lowerView.translatesAutoresizingMaskIntoConstraints = false
        anyView.lowerView.topAnchor.constraint(equalTo: anyView.upperView.bottomAnchor, constant: 5).isActive = true
        anyView.lowerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        anyView.lowerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        anyView.lowerView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        anyView.lowerCollectinView.translatesAutoresizingMaskIntoConstraints = false
        anyView.lowerCollectinView.topAnchor.constraint(equalTo: anyView.lowerView.topAnchor).isActive = true
        anyView.lowerCollectinView.leadingAnchor.constraint(equalTo: anyView.lowerView.leadingAnchor, constant: 5).isActive = true
        anyView.lowerCollectinView.trailingAnchor.constraint(equalTo: anyView.lowerView.trailingAnchor, constant: -5).isActive = true
        anyView.lowerCollectinView.bottomAnchor.constraint(equalTo: anyView.lowerView.bottomAnchor).isActive = true
        
        anyView.stackViewVertical.translatesAutoresizingMaskIntoConstraints = false
        anyView.stackViewVertical.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        anyView.stackViewVertical.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        anyView.stackViewVertical.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.6).isActive = true
        anyView.stackViewVertical.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.3).isActive = true
        
        anyView.cancelBtn.translatesAutoresizingMaskIntoConstraints = false
        anyView.cancelBtn.centerXAnchor.constraint(equalTo: anyView.stackViewVertical.centerXAnchor).isActive = true
        anyView.cancelBtn.centerYAnchor.constraint(equalTo: anyView.cancelBtnView.centerYAnchor).isActive = true
        anyView.cancelBtn.widthAnchor.constraint(equalTo: anyView.cancelBtnView.widthAnchor, multiplier: 0.2).isActive = true
        anyView.cancelBtn.heightAnchor.constraint(equalTo: anyView.cancelBtn.widthAnchor).isActive = true
    }
}

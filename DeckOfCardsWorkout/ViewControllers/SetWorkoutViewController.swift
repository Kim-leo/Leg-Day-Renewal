//
//  SetWorkoutViewController.swift
//  DeckOfCardsWorkout
//
//  Created by 김승현 on 2/25/24.
//

import UIKit

class SetWorkoutViewController: UIViewController {
    // MARK: - Parameters
    
    let workoutSorting = WorkoutSorting()
    let chosenWorkouts = ChosenWorkouts.shared
    var originalWorkouts = [String]()
    let viewFile = ViewFile()
    
    var whichWorkout: String = ""
    var inputWorkout: String = ""
    
    
    
    // MARK: - View Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.leftBarButtonItem = self.leftBarBtn
        
        setupUI()
        viewsLayout()
        
        initialSetting()
        
        
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
            let width = viewFile.upperCollectinView.frame.width / 4
            let height = viewFile.upperCollectinView.frame.height
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
                viewFile.lowerCollectinView.reloadData()
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
                    inputWorkout = alert.textFields?[0].text ?? ""
                    viewFile.lowerCollectinView.alpha = 0.5
                    viewFile.stackViewVertical.alpha = 1
                    self.view.bringSubviewToFront(viewFile.stackViewVertical)
                }
                let cancel = UIAlertAction(title: "취소", style: .cancel) { (cancel) in }
                alert.addAction(okAction)
                alert.addAction(cancel)
                self.present(alert, animated: true, completion: nil)
            default:
                collectionView.alpha = 0.5
                viewFile.verticalStackViewForSettingPokerShapes.alpha = 1
                self.view.bringSubviewToFront(viewFile.verticalStackViewForSettingPokerShapes)
                whichWorkout = chosenWorkouts.yourAllWorkoutsArray[indexPath.row]
            }
        default:
            break
        }
    }
}


// MARK: - View Layout
extension SetWorkoutViewController {
    func initialSetting() {
        if chosenWorkouts.yourAllWorkoutsArray.count == 1 {
            chosenWorkouts.yourAllWorkoutsArray += Array(chosenWorkouts.workoutForCategories.joined())
            originalWorkouts = chosenWorkouts.yourAllWorkoutsArray
        }
    }
    
    @objc func categoryBtnTapped(_ sender: UIButton) {
        viewFile.stackViewVertical.alpha = 0
        viewFile.lowerCollectinView.alpha = 1
        chosenWorkouts.workoutForCategories[sender.tag].append(inputWorkout)
        viewFile.lowerCollectinView.reloadData()
        viewFile.lowerCollectinView.performBatchUpdates {
            viewFile.lowerCollectinView.insertItems(at: [IndexPath(item: 1, section: 0)])
            chosenWorkouts.yourAllWorkoutsArray.insert(inputWorkout, at: 1)
        } completion: { [weak self] _ in
        }
        originalWorkouts.append(inputWorkout)
    }
    
    @objc func cancelBtnTapped(_ sender: UIButton) {
        inputWorkout = ""
        viewFile.stackViewVertical.alpha = 0
        viewFile.lowerCollectinView.alpha = 1
    }
    
    @objc func pokerShapeBtnsTapped(_ sender: UIButton) {
        viewFile.verticalStackViewForSettingPokerShapes.alpha = 0
        viewFile.lowerCollectinView.alpha = 1
        
        sender.setTitle(whichWorkout, for: .normal)
        
        chosenWorkouts.selectedWorkoutPerPokerShapeArray[sender.tag] = whichWorkout
        print(chosenWorkouts.selectedWorkoutPerPokerShapeArray)
    }
    
    func setupUI() {
        [viewFile.upperView, viewFile.lowerView, viewFile.stackViewVertical, viewFile.verticalStackViewForSettingPokerShapes].map {
            self.view.addSubview($0)
        }
        
        [viewFile.stackViewHorizontal1, viewFile.stackViewHorizontal2, viewFile.cancelBtnView].map {
            viewFile.stackViewVertical.addArrangedSubview($0)
        }
        
        viewFile.categoryBtns.map {
            $0.setTitle("\(workoutSorting.typeOfWorkouts[$0.tag])", for: .normal)
            $0.addTarget(self, action: #selector(categoryBtnTapped), for: .touchUpInside)
        }
        viewFile.cancelBtn.addTarget(self, action: #selector(cancelBtnTapped), for: .touchUpInside)
        
        viewFile.pokerShapeBtns.map {
            $0.addTarget(self, action: #selector(pokerShapeBtnsTapped), for: .touchUpInside)
        }
        
        viewFile.upperView.addSubview(viewFile.upperCollectinView)
        viewFile.lowerView.addSubview(viewFile.lowerCollectinView)
        
        viewFile.upperCollectinView.delegate = self
        viewFile.upperCollectinView.dataSource = self
        viewFile.lowerCollectinView.delegate = self
        viewFile.lowerCollectinView.dataSource = self
        
        viewFile.stackViewVertical.alpha = 0
        viewFile.verticalStackViewForSettingPokerShapes.alpha = 0
    }
    
    func viewsLayout() {
        viewFile.upperView.translatesAutoresizingMaskIntoConstraints = false
        viewFile.upperView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        viewFile.upperView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        .isActive = true
        viewFile.upperView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        viewFile.upperView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        viewFile.upperCollectinView.translatesAutoresizingMaskIntoConstraints = false
        viewFile.upperCollectinView.topAnchor.constraint(equalTo: viewFile.upperView.topAnchor).isActive = true
        viewFile.upperCollectinView.leadingAnchor.constraint(equalTo: viewFile.upperView.leadingAnchor).isActive = true
        viewFile.upperCollectinView.trailingAnchor.constraint(equalTo: viewFile.upperView.trailingAnchor).isActive = true
        viewFile.upperCollectinView.bottomAnchor.constraint(equalTo: viewFile.upperView.bottomAnchor).isActive = true
        
        viewFile.lowerView.translatesAutoresizingMaskIntoConstraints = false
        viewFile.lowerView.topAnchor.constraint(equalTo: viewFile.upperView.bottomAnchor, constant: 5).isActive = true
        viewFile.lowerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        viewFile.lowerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        viewFile.lowerView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        viewFile.lowerCollectinView.translatesAutoresizingMaskIntoConstraints = false
        viewFile.lowerCollectinView.topAnchor.constraint(equalTo: viewFile.lowerView.topAnchor).isActive = true
        viewFile.lowerCollectinView.leadingAnchor.constraint(equalTo: viewFile.lowerView.leadingAnchor, constant: 5).isActive = true
        viewFile.lowerCollectinView.trailingAnchor.constraint(equalTo: viewFile.lowerView.trailingAnchor, constant: -5).isActive = true
        viewFile.lowerCollectinView.bottomAnchor.constraint(equalTo: viewFile.lowerView.bottomAnchor).isActive = true
        
        viewFile.stackViewVertical.translatesAutoresizingMaskIntoConstraints = false
        viewFile.stackViewVertical.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        viewFile.stackViewVertical.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        viewFile.stackViewVertical.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.6).isActive = true
        viewFile.stackViewVertical.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.3).isActive = true
        
        viewFile.cancelBtn.translatesAutoresizingMaskIntoConstraints = false
        viewFile.cancelBtn.centerXAnchor.constraint(equalTo: viewFile.stackViewVertical.centerXAnchor).isActive = true
        viewFile.cancelBtn.centerYAnchor.constraint(equalTo: viewFile.cancelBtnView.centerYAnchor).isActive = true
        viewFile.cancelBtn.widthAnchor.constraint(equalTo: viewFile.cancelBtnView.widthAnchor, multiplier: 0.2).isActive = true
        viewFile.cancelBtn.heightAnchor.constraint(equalTo: viewFile.cancelBtn.widthAnchor).isActive = true
        
        viewFile.verticalStackViewForSettingPokerShapes.translatesAutoresizingMaskIntoConstraints = false
        viewFile.verticalStackViewForSettingPokerShapes.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        viewFile.verticalStackViewForSettingPokerShapes.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        viewFile.verticalStackViewForSettingPokerShapes.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.6).isActive = true
        viewFile.verticalStackViewForSettingPokerShapes.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.3).isActive = true
    }
}

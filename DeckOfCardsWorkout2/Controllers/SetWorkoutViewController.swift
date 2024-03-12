//
//  SetWorkoutViewController.swift
//  DeckOfCardsWorkout2
//
//  Created by 김승현 on 3/5/24.
//

import UIKit

class SetWorkoutViewController: UIViewController {
    
    let myView = ViewForSetWorkoutVC()
//    let viewModel = ViewModelForSetWorkoutVC(workoutMode: WorkoutModel())
    let viewModel = ViewModelForSetWorkoutVC.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = self.leftBarBtn
        
        self.view.addSubview(myView)
        setupViewLayout(yourView: myView)
        
        myView.upperCollectinView.delegate = self
        myView.upperCollectinView.dataSource = self
        myView.lowerCollectinView.delegate = self
        myView.lowerCollectinView.dataSource = self
        
        viewModel.initialSetting(view: myView)
        
        myView.categoryBtns.map {
            $0.addTarget(self, action: #selector(categoryBtnTapped), for: .touchUpInside)
        }
        myView.cancelBtn.addTarget(self, action: #selector(cancelBtnTapped), for: .touchUpInside)
        
        myView.pokerShapeBtns.map {
            $0.addTarget(self, action: #selector(pokerShapeBtnsTapped), for: .touchUpInside)
        }
        
        
        print(viewModel.selectedWorkoutPerPokerShapeArray)
//        print(viewModel.yourAllWorkoutsArray)
    }
    
}

extension SetWorkoutViewController {
    @objc func categoryBtnTapped(_ sender: UIButton) {
        viewModel.workoutForCategories[sender.tag].append(viewModel.inputWorkout)
        viewModel.categoryBtnTapped(view: myView)
//        print(viewModel.yourAllWorkoutsArray)
    }
    
    @objc func cancelBtnTapped(_ sender: UIButton) {
        viewModel.cancelBtnTapped(view: myView)
    }
    
    @objc func pokerShapeBtnsTapped(_ sender: UIButton) {
        viewModel.pokerCardBtnTapped(view: myView, sender)
//        sender.setTitle(viewModel.whichWorkout, for: .normal)
//        myView.pokerWorkoutNameLabels.map { $0.text = "\(viewModel.selectedWorkoutPerPokerShapeArray[$0.tag])" }
        myView.pokerWorkoutNameLabels[sender.tag].text = viewModel.whichWorkout
        
//        viewModel.selectedWorkoutPerPokerShapeArray[sender.tag] = viewModel.whichWorkout
    }
}

extension SetWorkoutViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView.tag {
        case 0:
            return viewModel.typeOfWorkouts.count
        case 1:
            return viewModel.yourAllWorkoutsArray.count
        default:
            return 0
            break
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView.tag {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UpperCell", for: indexPath) as? UpperCell else { return UICollectionViewCell() }
            cell.typesOfWorkoutLabel.text = viewModel.typeOfWorkouts[indexPath.row]
            
            return cell
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LowerCell", for: indexPath) as? LowerCell else { return UICollectionViewCell() }
            cell.typesOfWorkoutLabel.text = viewModel.yourAllWorkoutsArray[indexPath.row]
            
            return cell
        default:
            return UICollectionViewCell()
            break
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView.tag {
        case 0:
            let width = myView.upperCollectinView.frame.width / 4
            let height = myView.upperCollectinView.frame.height
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
                viewModel.yourAllWorkoutsArray.removeAll()
                if viewModel.typeOfWorkouts[indexPath.row] == "전체" {
                    viewModel.yourAllWorkoutsArray.append("+ 직접 입력")
                    viewModel.yourAllWorkoutsArray += Array(viewModel.workoutForCategories.joined())
                } else {
                    viewModel.yourAllWorkoutsArray += Array(viewModel.workoutForCategories[indexPath.row])
                }
                myView.lowerCollectinView.reloadData()
            }
        case 1:
            print(viewModel.yourAllWorkoutsArray[indexPath.row])
            switch viewModel.yourAllWorkoutsArray[indexPath.row] {
            case "+ 직접 입력":
                viewModel.addWorkoutByYourself(view: myView, vc: self)
            default:
                collectionView.alpha = 0.5
                myView.verticalStackViewForSettingPokerShapes.alpha = 1
                self.view.bringSubviewToFront(myView.verticalStackViewForSettingPokerShapes)
                viewModel.whichWorkout = viewModel.yourAllWorkoutsArray[indexPath.row]
//                myView.pokerShapeBtns.map { $0.setTitle("\(viewModel.selectedWorkoutPerPokerShapeArray[$0.tag])", for: .normal)}
                myView.pokerWorkoutNameLabels.map { $0.text = "\(viewModel.selectedWorkoutPerPokerShapeArray[$0.tag])" }
            }
            
        default:
            break
        }
    }
    
}



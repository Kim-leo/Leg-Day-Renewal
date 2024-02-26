//
//  SetWorkoutViewController.swift
//  DeckOfCardsWorkout
//
//  Created by 김승현 on 2/25/24.
//

import UIKit

class SetWorkoutViewController: UIViewController {

    // MARK: - View
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
    
    
    
    // MARK: - Parameters
    
    let workoutSorting = WorkoutSorting()
    let chosenWorkouts = ChosenWorkouts.shared
    
    // MARK: - View Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.leftBarButtonItem = self.leftBarBtn
        self.navigationItem.rightBarButtonItem = self.rightBarBtn

        /*
         [startWorkoutVCBtn, setWorkoutVCBtn].map {
             self.stackViewForBtns.addArrangedSubview($0)
         }
         */
        [upperView, lowerView].map {
            self.view.addSubview($0)
        }
        upperView.addSubview(upperCollectinView)
        lowerView.addSubview(lowerCollectinView)
        
        upperCollectinView.delegate = self
        upperCollectinView.dataSource = self
        lowerCollectinView.delegate = self
        lowerCollectinView.dataSource = self
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
            let width = upperCollectinView.frame.width / 4
            let height = upperCollectinView.frame.height
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
                self.lowerCollectinView.reloadData()
            }
        case 1:
            print("hi")
        default:
            break
        }
    }
}


// MARK: - View Layout
extension SetWorkoutViewController {
    func viewsLayout() {
        upperView.translatesAutoresizingMaskIntoConstraints = false
        upperView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        upperView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        .isActive = true
        upperView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        upperView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        upperCollectinView.translatesAutoresizingMaskIntoConstraints = false
        upperCollectinView.topAnchor.constraint(equalTo: upperView.topAnchor).isActive = true
        upperCollectinView.leadingAnchor.constraint(equalTo: upperView.leadingAnchor).isActive = true
        upperCollectinView.trailingAnchor.constraint(equalTo: upperView.trailingAnchor).isActive = true
        upperCollectinView.bottomAnchor.constraint(equalTo: upperView.bottomAnchor).isActive = true
        
        lowerView.translatesAutoresizingMaskIntoConstraints = false
        lowerView.topAnchor.constraint(equalTo: self.upperView.bottomAnchor, constant: 5).isActive = true
        lowerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        lowerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        lowerView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        lowerCollectinView.translatesAutoresizingMaskIntoConstraints = false
        lowerCollectinView.topAnchor.constraint(equalTo: lowerView.topAnchor).isActive = true
        lowerCollectinView.leadingAnchor.constraint(equalTo: lowerView.leadingAnchor, constant: 5).isActive = true
        lowerCollectinView.trailingAnchor.constraint(equalTo: lowerView.trailingAnchor, constant: -5).isActive = true
        lowerCollectinView.bottomAnchor.constraint(equalTo: lowerView.bottomAnchor).isActive = true
        
    }
}

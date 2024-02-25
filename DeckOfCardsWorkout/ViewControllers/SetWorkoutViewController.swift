//
//  SetWorkoutViewController.swift
//  DeckOfCardsWorkout
//
//  Created by 김승현 on 2/25/24.
//

import UIKit

class SetWorkoutViewController: UIViewController {

    // MARK: - View
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
    
    lazy var upperView: UIView = {
        let v = UIView()
        v.backgroundColor = .black
        return v
    }()
    
    lazy var upperCollectinView: UICollectionView = {
        let layout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.footerReferenceSize = .zero
        layout.headerReferenceSize = .zero
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .systemBlue
        cv.tag = 0
        cv.isPagingEnabled = true
        cv.showsHorizontalScrollIndicator = false
        cv.register(UpperCell.self, forCellWithReuseIdentifier: "UpperCell")
        cv.backgroundColor = .lightGray
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

        self.view.addSubview(upperView)
        upperView.addSubview(upperCollectinView)
        
        upperCollectinView.delegate = self
        upperCollectinView.dataSource = self
        
        viewsLayout()
    }
    
}

extension SetWorkoutViewController {
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
// MARK: - CollectionView Extension
extension SetWorkoutViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView.tag {
        case 0:
            return workoutSorting.typeOfWorkouts.count
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
        default:
            return CGSize()
            break
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView.tag {
        case 0:
            print(workoutSorting.typeOfWorkouts[indexPath.row])
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
        
    }
}

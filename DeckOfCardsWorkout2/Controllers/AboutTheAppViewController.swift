//
//  AboutTheAppViewController.swift
//  DeckOfCardsWorkout2
//
//  Created by 김승현 on 3/5/24.
//

import UIKit

class AboutTheAppViewController: UIViewController {

    let myView = ViewForAboutTheAppVC()
    var viewModel = ViewModelForAboutTheApp()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "운동 설명"
        self.navigationItem.leftBarButtonItem = self.leftBarBtn
        
        self.view.addSubview(myView)
        setupViewLayout(yourView: myView)
        
        myView.descriptionBtns.map {
            $0.addTarget(self, action: #selector(descriptionBtnTapped), for: .touchUpInside)
        }
        myView.xBtn.addTarget(self, action: #selector(xBtnTapped), for: .touchUpInside)
        myView.leftBtn.addTarget(self, action: #selector(leftOrRightBtnTapped), for: .touchUpInside)
        myView.rightBtn.addTarget(self, action: #selector(leftOrRightBtnTapped), for: .touchUpInside)
        
        myView.descripTionCollectionView.delegate = self
        myView.descripTionCollectionView.dataSource = self
        
        
        
    }
    

}

extension AboutTheAppViewController {
    @objc func descriptionBtnTapped(_ sender: UIButton, tag: Int) {
        viewModel.descriptionBtnsTapped(view: myView)
    }
    
    @objc func xBtnTapped(_ sender: UIButton, tag: Int) {
        viewModel.xBtnTapped(view: myView)
    }
    
    @objc func leftOrRightBtnTapped(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            viewModel.leftBtnTapped(view: myView)
        case 1:
            viewModel.rightBtnTapped(view: myView)
        default:
            break
        }
    }
}

extension AboutTheAppViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DescriptionCell", for: indexPath) as? DescriptionCell else { return UICollectionViewCell() }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
    }
    
    
}

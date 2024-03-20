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
        viewModel.descriptionBtnsTapped(view: myView, sender)
        
        
        
//        switch viewModel.chosenBtnTag {
//        case 0:
//            myView.descripTionCollectionView.backgroundColor = color1[0]
//        case 1:
//            myView.descripTionCollectionView.backgroundColor = color2[0]
//        case 2:
//            myView.descripTionCollectionView.backgroundColor = color3[0]
//        default:
//            print("?")
//            break
//        }
        
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
        let numberOfCells = viewModel.screenImageName[viewModel.chosenBtnTag].count
        myView.pageControBar.numberOfPages = numberOfCells
        return numberOfCells
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DescriptionCell", for: indexPath) as? DescriptionCell else { return .init() }
//        collectionView.reloadData() -> 사용 금지
        let imageName: String = "\(viewModel.screenImageName[viewModel.chosenBtnTag][indexPath.row])" + ".jpg"
        cell.screenImageView.image = UIImage(named: imageName)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
    }
    
    

}

extension AboutTheAppViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.frame.size.width != 0 {
            let value = (scrollView.contentOffset.x / scrollView.frame.width)
            myView.pageControBar.currentPage = Int(round(value))
        }
        print(myView.pageControBar.currentPage)
    }
}

//
//  ChooseWorkoutViewController.swift
//  LegDay
//
//  Created by 김승현 on 2023/01/24.
//

import UIKit

class ChooseWorkoutViewController: UIViewController {

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
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.leftBarButtonItem = self.leftBarBtn
        self.navigationItem.rightBarButtonItem = self.rightBarBtn
    }
    

    @objc func leftBarBtnTapped(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func rightBarBtnTapped(_ sender: UIBarButtonItem) {
        print("Tapped")
    }

}

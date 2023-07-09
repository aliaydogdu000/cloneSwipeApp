//
//  ViewController.swift
//  cloneTinder
//
//  Created by Ali Aydoğdu on 7.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    let topStackView = TopNavigationStackView()
    let blueView = UIView()
    let buttonStackView = HomeBottomControlsStackView()

    fileprivate func setUpLayout(_ blueView: UIView) {
        let overallStackView = UIStackView(arrangedSubviews: [topStackView,blueView,buttonStackView])
        overallStackView.axis = .vertical
        view.addSubview(overallStackView)
        overallStackView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        blueView.backgroundColor = .blue
        setUpLayout(blueView)

    }


}


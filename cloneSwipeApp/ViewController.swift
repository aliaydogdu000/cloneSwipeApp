//
//  ViewController.swift
//  cloneTinder
//
//  Created by Ali Aydoğdu on 7.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    let topStackView = TopNavigationStackView()
    let cardsDeckView = UIView()
    let buttonStackView = HomeBottomControlsStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpLayout(cardsDeckView)
        
        setUpDummyCard()
    }
    
    fileprivate func setUpDummyCard(){
        let cardView = CardView(frame: .zero)
        cardsDeckView.addSubview(cardView)
        cardView.fillSuperview()
    }
    
    fileprivate func setUpLayout(_ blueView: UIView) {
        let overallStackView = UIStackView(arrangedSubviews: [topStackView,blueView,buttonStackView])
        overallStackView.axis = .vertical
        view.addSubview(overallStackView)
        overallStackView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor)
        overallStackView.isLayoutMarginsRelativeArrangement = true
        overallStackView.layoutMargins = .init(top:0,left:12,bottom: 0,right: 12)
        
        overallStackView.bringSubviewToFront(cardsDeckView)
    }


}


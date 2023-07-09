//
//  HomeBottomControlsStackView.swift
//  cloneSwipeApp
//
//  Created by Ali Aydoğdu on 9.07.2023.
//

import UIKit

class HomeBottomControlsStackView: UIStackView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        distribution = .fillEqually
        heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        let subviews = [UIImage(named: "refresh_circle"),UIImage(named: "dismiss_circle"),UIImage(named: "super_like_circle"),UIImage(named: "like_circle"),UIImage(named: "boost_circle")].map { (img) -> UIView in
            let button = UIButton(type: .system)
            button.setImage(img, for: .normal)
            return button
        }
        
      
        subviews.forEach{(v) in
            
            addArrangedSubview(v)
        }
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

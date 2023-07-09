//
//  TopNavigationStackView.swift
//  cloneSwipeApp
//
//  Created by Ali Aydoğdu on 9.07.2023.
//

import UIKit

class TopNavigationStackView: UIStackView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        distribution = .fillEqually
        heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        let subviews = [UIImage(named: "top_left_profile"),UIImage(named: "app_icon"),UIImage(named: "top_right_messages")].map { (img) -> UIView in
            let button = UIButton(type: .system)
            button.setImage(img?.withRenderingMode(.alwaysOriginal), for: .normal)
            return button
        }
        subviews.forEach{(v) in
            
            addArrangedSubview(v)
        }
        
        
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
}

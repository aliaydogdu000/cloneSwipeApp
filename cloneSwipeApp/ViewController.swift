//
//  ViewController.swift
//  cloneTinder
//
//  Created by Ali Aydoğdu on 7.07.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let subViews = [UIColor.gray,UIColor.darkGray,UIColor.black].map{
            (color)-> UIView in
            let v = UIView()
            v.backgroundColor = color
            return v
            
        }
        
        let topStackView=UIStackView(arrangedSubviews: subViews)
        topStackView.distribution = .fillEqually
        
        topStackView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        let blueView = UIView()
        blueView.backgroundColor = .blue
        
       
        let buttonStackView = HomeBottomControlsStackView()
        
        
        
        let overallStackView = UIStackView(arrangedSubviews: [topStackView,blueView,buttonStackView])
        overallStackView.axis = .vertical
        view.addSubview(overallStackView)
        overallStackView.fillSuperview()

    }


}


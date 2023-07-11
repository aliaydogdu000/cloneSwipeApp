//
//  ViewController.swift
//  cloneTinder
//
//  Created by Ali Aydoğdu on 7.07.2023.
//

import UIKit

class HomeController: UIViewController {
    
    let topStackView = TopNavigationStackView()
    let cardsDeckView = UIView()
    let buttonStackView = HomeBottomControlsStackView()
    
    let users = [
    User(name: "Maria", age: 23, profession: "Developer", imageName: "lady5c"),
    User(name: "Jane", age: 18, profession: "DJ", imageName: "lady4c")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLayout(cardsDeckView)
        setUpDummyCard()
    }
    
    fileprivate func setUpDummyCard(){
        users.forEach { (u) in
            let cardView = CardView(frame: .zero)
            cardView.imageView.image = UIImage(named: u.imageName)
            cardView.informationLabel.text = "\(u.name) \(u.age)\n\(u.profession)"
            
            let attributedText = NSMutableAttributedString(string: u.name,attributes: [.font:UIFont.systemFont(ofSize: 32,weight: .heavy)])
            attributedText.append(NSAttributedString(string: " \(u.age)",attributes: [.font:UIFont.systemFont(ofSize: 24,weight: .regular)]))
            
            attributedText.append(NSAttributedString(string: "\n\(u.profession)",attributes: [.font:UIFont.systemFont(ofSize: 20,weight: .regular)]))
            
            cardView.informationLabel.attributedText = attributedText
            
            cardsDeckView.addSubview(cardView)
            cardView.fillSuperview()
        }
        
        
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


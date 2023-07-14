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
    
   
    let cardViewModels:[CardViewModel] = {
        let producers = [
            User(name: "Kelly", age: 23, profession: "Developer", imageNames: ["kelly1","kelly2","kelly3"]),
            Advertiser(title: "ADVERTISEMENT EXAMPLE", brandName: "Clone Tinder Swipe App", posterPhotoName: "slide_out_menu_poster"),
            User(name: "Jane", age: 18, profession: "Student", imageNames: ["jane1","jane2","jane3"])

        ] as [ProducesCardViewModel]
        
        let viewModels = producers.map({$0.toCardViewModel()})
        return viewModels
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLayout(cardsDeckView)
        setUpDummyCard()
    }
    
    fileprivate func setUpDummyCard(){
        cardViewModels.forEach { (cardVM) in
            let cardView = CardView(frame: .zero)
            cardView.cardViewModel = cardVM
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


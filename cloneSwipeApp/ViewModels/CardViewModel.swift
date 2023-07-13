//
//  CardViewModel.swift
//  cloneSwipeApp
//
//  Created by Ali Aydoğdu on 12.07.2023.
//

import UIKit

protocol ProducesCardViewModel{
    func toCardViewModel() -> CardViewModel
}

struct CardViewModel{
    let imageName : String
    let attributedString : NSAttributedString
    let textAlignment : NSTextAlignment
    
}

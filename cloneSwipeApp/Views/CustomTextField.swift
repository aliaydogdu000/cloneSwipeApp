//
//  CustomTextField.swift
//  cloneSwipeApp
//
//  Created by Ali Aydoğdu on 25.07.2023.
//

import UIKit

class CustomTextField:UITextField {
    let padding:CGFloat
    init(padding:CGFloat){
        self.padding = padding
        super.init(frame: .zero)
        layer.cornerRadius = 24

    }
    
    override var intrinsicContentSize: CGSize{
        return .init(width: 0, height: 50)
    }
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 16, dy: 0)

    }
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 16, dy: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//
//  CardView.swift
//  cloneSwipeApp
//
//  Created by Ali Aydoğdu on 10.07.2023.
//

import UIKit

class CardView: UIView {
    
    let imageView = UIImageView(image: UIImage(named: "lady5c"))
    let informationLabel = UILabel()
    //configurations
    fileprivate let treshold:CGFloat = 100


    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 10
        clipsToBounds = true
        
        imageView.contentMode = .scaleAspectFill
        addSubview(imageView)
        imageView.fillSuperview()
        
        addSubview(informationLabel)
        informationLabel.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor,padding: .init(top: 0, left: 16, bottom: 16, right: 16))
        
        informationLabel.text = "TEST TEST"
        informationLabel.textColor = .white
        informationLabel.font = UIFont.systemFont(ofSize: 34,weight: .heavy)
        informationLabel.numberOfLines = 0
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        addGestureRecognizer(panGesture)
    }
    
    fileprivate func handleChanged(gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: nil)
        //rotation
        let degrees:CGFloat = translation.x / 20
        let angle = degrees * .pi / 180
        
        let rotationalTransformation = CGAffineTransform(rotationAngle: angle)
        self.transform = rotationalTransformation.translatedBy(x: translation.x, y: translation.y)
        
        
    }
    
    fileprivate func handleEnded(gesture: UIPanGestureRecognizer) {
        let transationDirection:CGFloat =  gesture.translation(in: nil).x > 0 ? 1 : -1
        let shouldDismissCard = abs(gesture.translation(in: nil).x) > treshold
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.1,options: .curveEaseOut,animations: {
            
            if shouldDismissCard{
                self.frame = CGRect(x: 600 * transationDirection, y: 0, width: self.frame.width, height: self.frame.height)
            }else{
                self.transform = .identity
            }
        }) { (_) in
            self.transform = .identity
            if shouldDismissCard{
                self.removeFromSuperview()
            }

        }
    }
    
    
    @objc fileprivate func handlePan(gesture:UIPanGestureRecognizer){
        
        switch gesture.state {
        case .changed:
            handleChanged(gesture: gesture)
        case .ended:
            handleEnded(gesture: gesture)
        default:
            ()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}

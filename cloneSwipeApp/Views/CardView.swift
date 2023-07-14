//
//  CardView.swift
//  cloneSwipeApp
//
//  Created by Ali Aydoğdu on 10.07.2023.
//

import UIKit

class CardView: UIView {
    
    var cardViewModel: CardViewModel!{
        didSet {
            let imageName = cardViewModel.imageNames.first ?? ""
            imageView.image = UIImage(named: imageName)
            informationLabel.attributedText = cardViewModel.attributedString
            informationLabel.textAlignment = cardViewModel.textAlignment
            
            (0..<cardViewModel.imageNames.count).forEach { (_) in
                let barView = UIView()
                barView.backgroundColor = barDeselectColor
                barsStackView.addArrangedSubview(barView)
            }
            barsStackView.arrangedSubviews.first?.backgroundColor = .white
            
            setupImageIndexObserver()
        }
    }
    
    fileprivate func setupImageIndexObserver(){
        cardViewModel.imageIndexObserver = { [weak self] (index,image) in
            self?imageView.image = image
            
            self?.barsStackView.arrangedSubviews.forEach ({ (v) in
                v.backgroundColor = self?.barDeselectColor
            })
            self?.barsStackView.arrangedSubviews[index].backgroundColor = .white
        }
    }
    
    fileprivate let imageView = UIImageView(image: UIImage(named: "lady5c"))
    fileprivate let gradientLayer = CAGradientLayer()
    fileprivate let informationLabel = UILabel()
    //configurations
    fileprivate let treshold:CGFloat = 100

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpLayout()
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        addGestureRecognizer(panGesture)
        let tapGesture = UIPanGestureRecognizer(target: self, action: #selector(handleTap))
        addGestureRecognizer(tapGesture)
    }
    
    var imageIndex = 0
    fileprivate let barDeselectColor =  UIColor(white: 0, alpha: 0.1)
    
    @objc fileprivate func handleTap(gesture:UITapGestureRecognizer){
        let tapLocation = gesture.location(in: nil)
        let shouldAdvance = tapLocation.x > frame.width/2 ? true : false
       
        if shouldAdvance{
            cardViewModel.advanceToNextPhoto()
        }else{
            cardViewModel.goToPreviousPhoto()
        }
    }
    
    fileprivate func setUpLayout() {
        layer.cornerRadius = 10
        clipsToBounds = true
        
        imageView.contentMode = .scaleAspectFill
        addSubview(imageView)
        imageView.fillSuperview()
        
        setupBarsStackView()
        
        setUpGradientLayer()
        
        addSubview(informationLabel)
        informationLabel.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor,padding: .init(top: 0, left: 16, bottom: 16, right: 16))
        
        informationLabel.textColor = .white
        informationLabel.numberOfLines = 0
    }
    
    fileprivate let barsStackView = UIStackView()

    fileprivate func setupBarsStackView(){
        addSubview(barsStackView)
        barsStackView.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor,padding: .init(top: 8, left: 8, bottom: 0, right: 8),size: .init(width: 0, height: 4))
        barsStackView.spacing = 4
        barsStackView.distribution = .fillEqually
        
    }
    
    fileprivate func setUpGradientLayer(){
        gradientLayer.colors = [UIColor.clear.cgColor,UIColor.black.cgColor]
        gradientLayer.locations = [0.5,1]
        
        layer.addSublayer(gradientLayer)
    }
    
    override func layoutSubviews() {
        gradientLayer.frame = self.frame
    }
    
    @objc fileprivate func handlePan(gesture:UIPanGestureRecognizer){
        
        switch gesture.state {
        case .began:
            superview?.subviews.forEach({ (subviews) in
                subviews.layer.removeAllAnimations()
            })
        case .changed:
            handleChanged(gesture: gesture)
        case .ended:
            handleEnded(gesture: gesture)
        default:
            ()
        }
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
        let translationDirection: CGFloat = gesture.translation(in: nil).x > 0 ? 1 : -1
        let shouldDismissCard = abs(gesture.translation(in: nil).x) > treshold
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.1, options: .curveEaseOut, animations: {
            if shouldDismissCard {
                self.frame = CGRect(x: 600 * translationDirection, y: 0, width: self.frame.width, height: self.frame.height)
            } else {
                self.transform = .identity
            }
            
        }) { (_) in
            self.transform = .identity
            if shouldDismissCard {
                self.removeFromSuperview()
            }
}
    }
    
   
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}

//
//  UIView+Animation.swift
//  MyCameraApp
//
//  Created by Field Employee on 12/14/21.
//


import UIKit

extension UIView {
    func animateInView(delay: TimeInterval) {
        alpha = 0
        transform = CGAffineTransform(translationX: 0, y: -20)
        let animation = UIViewPropertyAnimator(duration: 0.2, curve: .easeInOut) {
            self.alpha = 1
            self.transform = .identity
        }
        animation.startAnimation(afterDelay: delay)
    }

    func animateOutView(delay: TimeInterval, completionHandler: (()-> Void)? = nil) {
        let animation = UIViewPropertyAnimator(duration: 0.2, curve: .easeInOut) {
            self.alpha = 0
            self.transform = CGAffineTransform(translationX: 0, y: -20)
        }
        animation.addCompletion { _ in
            completionHandler?()
            
        }
        animation.startAnimation(afterDelay: delay)
    }
}

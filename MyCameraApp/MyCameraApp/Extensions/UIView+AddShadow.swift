//
//  UIView+AddShadow.swift
//  MyCameraApp
//
//  Created by Field Employee on 12/14/21.
//

import UIKit

extension UIView {
    func addShadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 10
        layer.shadowOpacity = 0.3
        layer.shadowOffset = CGSize(width: 5, height: 10)
        layer.masksToBounds = true
        layer.cornerRadius = 4
    }
}


//
//  RequestCameraAuthorizationView.swift
//  MyCameraApp
//
//  Created by Field Employee on 12/14/21.
//

import UIKit

protocol RequestCameraAuthorizationViewDelegate: class {
func requestCameraAuthorizationActionButtonTapped()
}

class RequestCameraAuthorizationView: UIView {
    
    @IBOutlet private weak var contentView: UIView!
    
    @IBOutlet private weak var cameraImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var messageLabel: UILabel!
    @IBOutlet private weak var actionButton: UIButton!
    @IBOutlet private weak var actionButtonWidthConstraint: NSLayoutConstraint!
    weak var delegate: RequestCameraAuthorizationViewDelegate?
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        customInit()
    }
        
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        customInit()
    }
        
    private func customInit() {
        let bundle = Bundle.main
        let nibName = String(describing: Self.self)
        bundle.loadNibNamed(nibName, owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        addActionButtonShadow()
        
    }
    
    @IBAction func actionButtonHandler(btn: UIButton) {
            delegate?.requestCameraAuthorizationActionButtonTapped()
    }
    
    func addActionButtonShadow() {
        actionButton.addShadow()
    }
    
    func animateInViews() {
        let viewsToAnimate = [cameraImageView, titleLabel, messageLabel, actionButton]
        for (i, viewToAnimate) in viewsToAnimate.enumerated() {
            guard let view = viewToAnimate else { continue }
            view.animateInView(delay: Double(i) * 0.15)
        }
    }
    
    func animateOutViews(completionHandler: @escaping () -> Void) {
        let viewsToAnimate = [cameraImageView, titleLabel, messageLabel, actionButton]
        for (i, viewToAnimate) in viewsToAnimate.enumerated() {
            guard let view = viewToAnimate else { continue }
            var completionHandlerToCall: (() -> Void)? = nil
            if viewToAnimate == viewsToAnimate.last {
                completionHandlerToCall = completionHandler
            }
            view.animateOutView(delay: Double(i) * 0.15, completionHandler: completionHandlerToCall)
        }
    }
    
    func configureForErrorState() {
        titleLabel.text = "Camera Authorization Denied"
        actionButton.setTitle("Open Settings", for: .normal)
        actionButtonWidthConstraint.constant = 140
    }
}

private extension RequestCameraAuthorizationView {
    
}



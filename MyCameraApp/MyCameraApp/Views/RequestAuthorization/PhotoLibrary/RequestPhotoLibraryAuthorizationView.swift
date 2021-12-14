//
//  RequestPhotoLibraryAuthorizationView.swift
//  MyCameraApp
//
//  Created by Field Employee on 12/14/21.
//

import UIKit

protocol RequestPhotoLibraryAuthorizationViewDelegate: class {
    func requestPhotoLibraryAuthorizationTapped()
}

class RequestPhotoLibraryAuthorizationView: UIView {

    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var photoImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var messageLbl: UILabel!
    @IBOutlet private weak var actionButton: UIButton!
    @IBOutlet private weak var actionButtonWidthConstraint: NSLayoutConstraint!
    
    weak var delegate: RequestPhotoLibraryAuthorizationViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
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
        delegate?.requestPhotoLibraryAuthorizationTapped()
    }
    
    func animateInViews() {
        let viewsToAnimate = [photoImageView, titleLabel, messageLbl, actionButton]
        for (i, viewToAnimate) in viewsToAnimate.enumerated() {
            guard let view = viewToAnimate else { continue }
            view.animateInView(delay: Double(i) * 0.15)
        }
    }
    
    func animateOutViews(completionHandler: @escaping () -> Void) {
        let viewsToAnimate = [photoImageView, titleLabel, messageLbl, actionButton]
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
        titleLabel.text = "Photo Library Authorization Denied"
        actionButton.setTitle("Open Settings", for: .normal)
        actionButtonWidthConstraint.constant = 140
    }
}

private extension RequestPhotoLibraryAuthorizationView {
    func addActionButtonShadow() {
        actionButton.addShadow()
    }
}

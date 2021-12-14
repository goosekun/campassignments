//
//  AppSetup.swift
//  MyCameraApp
//
//  Created by Field Employee on 12/14/21.
//

import UIKit

class AppSetup {
    static func loadCaptureViewController() {
        let nibName = String(describing: CaptureViewController.self)
        let bundle = Bundle.main
        let captureViewController = CaptureViewController(nibName: nibName, bundle: bundle)
        let window = Self.keyWindow
        window?.rootViewController = captureViewController
        window?.makeKeyAndVisible()
    }
    
    static var keyWindow: UIWindow? {
        return UIApplication.shared.windows.first(where: {$0.isKeyWindow})
    }
}

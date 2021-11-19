//
//  ThirdViewController.swift
//  segue
//
//  Created by Field Employee on 11/18/21.
//

import UIKit

class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func cancel(_ sender: Any) {
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)

    }
}

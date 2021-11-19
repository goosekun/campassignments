//
//  SecondViewController.swift
//  segue
//
//  Created by Admin on 11/18/21.
//

import UIKit

class SecondViewController: UIViewController {

    var segue: String = "mySegue2"
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func next(_ sender: Any) {
        //perform segue
        performSegue(withIdentifier: segue, sender: nil)
    }

    
}

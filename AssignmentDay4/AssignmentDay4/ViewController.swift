//
//  ViewController.swift
//  AssignmentDay4
//
//  Created by Field Employee on 11/22/21.
//

import UIKit

class ViewController: UIViewController {

    let table = TableViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showTable(_ sender: Any) {
        table.myList = ["Apples", "Oranges", "Bananas", "Grapes"]
        navigationController?.pushViewController(table, animated: true)
    }
    
}


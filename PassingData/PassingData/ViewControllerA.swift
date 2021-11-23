//
//  ViewControllerA.swift
//  PassingData
//
//  Created by Field Employee on 11/23/21.
//

import UIKit

class ViewControllerA: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onButtonTap() {
            let vc = storyboard?.instantiateViewController(withIdentifier: "mainViewController2") as! ViewControllerB
        
        vc.passText = "Hello World"
            
            present(vc, animated: true, completion: nil)
        }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

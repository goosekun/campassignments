//
//  DetailViewController.swift
//  week3day2
//
//  Created by Field Employee on 11/30/21.
//

import UIKit

class DetailViewController: UIViewController {

    var myBrewery : Brewery?
    
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var type: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        location.text = myBrewery!.city! + "," + myBrewery!.state!
        name.text = myBrewery!.name
    
        // Do any additional setup after loading the view.
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

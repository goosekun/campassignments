//
//  InfoViewController.swift
//  Week2Exam
//
//  Created by Field Employee on 11/24/21.
//

import UIKit

class InfoViewController: UIViewController {

    var myObject : Album?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageV: UIImageView!
    @IBOutlet weak var textV: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(myObject?.description)
        titleLabel.text = myObject?.title
        imageV.image = myObject?.image
        textV.text = myObject?.description
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

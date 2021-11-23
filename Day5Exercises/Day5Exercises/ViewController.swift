//
//  ViewController.swift
//  Day5Exercises
//
//  Created by Field Employee on 11/23/21.
//

import UIKit

let currentDateTime = Date()

let userCalendar = Calendar.current

let requestedComponents: Set<Calendar.Component> = [
    .year,
    .month,
    .day
]

let dateTimeComponents = userCalendar.dateComponents(requestedComponents, from: currentDateTime)


class ViewController: UIViewController {

    let frame = CGRect(x: 0, y: 0, width: 200, height: 21)
    lazy var label = UILabel(frame: frame)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        displayLabel()
        displayDate()
        createMultipleLabels()
    }
 
    func displayLabel() {
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        label.backgroundColor = UIColor.blue
        label.heightAnchor.constraint(equalToConstant: 100).isActive = true
        label.widthAnchor.constraint(equalToConstant: 200).isActive = true
        label.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        label.isUserInteractionEnabled = true
        
    }
    
    func displayDate() {
        label.text =
        String(dateTimeComponents.month!) + "/" + String(dateTimeComponents.day!) + "/" + String(dateTimeComponents.year!)
        
    }
    
    func createMultipleLabels() {
        for i in 0..<5 {
            print("%d",i)
            let label = UILabel(frame: CGRect(x: 0, y: 21*i+5, width: 200, height: 21))
//            label.center = CGPointMake(160, 284)
            label.textAlignment = NSTextAlignment.center
            label.text = "I'am a test label"
            self.view.addSubview(label)
            
            label.isUserInteractionEnabled = true
        }
    }

    
    
}


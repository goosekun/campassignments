//
//  DetailViewController.swift
//  Week3Day3
//
//  Created by Field Employee on 12/1/21.
//

import UIKit

class DetailViewController: UIViewController {

    var movie: Movie?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var yearLbl: UILabel!
    @IBOutlet weak var descriptLbl: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let baseURL =  "https://image.tmdb.org/t/p/original/" + movie!.image
        let url = URL(string: baseURL)
        imageView.getImage(from: url!)
        yearLbl.text = String(movie!.year.split(separator: "-")[0])
        descriptLbl.text = movie?.description
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

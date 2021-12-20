//
//  DetailViewController.swift
//  Pokedex-Assignment
//
//  Created by Field Employee on 12/3/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    var myPokemon: Pokemon?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var elementLbl: UILabel!
    @IBOutlet weak var abilityLbl: UILabel!
    @IBOutlet weak var movesLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sprite = (myPokemon?.sprites.frontDefault) ?? ""
        guard let url = URL(string: sprite) else { return }
        imageView.getImage(from: url)
        nameLbl.text = myPokemon?.species.name
        elementLbl.text = myPokemon?.types[0].type.name
        
        var temp = [String]()
        if let abilities = myPokemon?.abilities {
            for element in abilities {
                temp.append(element.ability.name ?? "")
            }
            abilityLbl.text = temp.description
        }
        
        
        temp = []
        if let moves = myPokemon?.moves {
            for element in moves {
                temp.append(element.move.name ?? "")
            }
            
            movesLbl.text = temp.description
            movesLbl.adjustsFontSizeToFitWidth = true
            movesLbl.numberOfLines = 0
        }
        
        
        
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

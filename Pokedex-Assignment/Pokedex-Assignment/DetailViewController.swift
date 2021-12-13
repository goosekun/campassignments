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
        
        let sprite = (myPokemon?.sprites.frontDefault!)!
        imageView.getImage(from: URL(string: sprite)!)
        nameLbl.text = myPokemon?.species.name
        elementLbl.text = myPokemon?.types[0].type.name
        var temp = [String]()
        for element in myPokemon!.abilities {
            temp.append(element.ability.name!)
        }
        abilityLbl.text = temp.description
        
        temp = []
        for element in myPokemon!.moves {
            temp.append(element.move.name!)
        }
        movesLbl.text = temp.description
        
        
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

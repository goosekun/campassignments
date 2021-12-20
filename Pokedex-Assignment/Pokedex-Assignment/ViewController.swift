//
//  ViewController.swift
//  Pokedex-Assignment
//
//  Created by Field Employee on 12/3/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    
    private let PokemonAPI = APICalls()
    
    var pokemons : [Pokemon?] = []
    
    var page = 0
    var offset = 0
    var totalItems = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegates()
//        PokemonAPI.getPokemons { result in
//            DispatchQueue.main.async {
//                self.pokemons = result
//                self.tableview.reloadData()
//            }
//        }
        load(offset: 20)
    }
    
    func setupDelegates() {
        tableview.delegate = self
        tableview.dataSource = self
    }
    
    func load(offset: Int = 20) {
        let temp = offset * self.page
        PokemonAPI.getPokemons(offset: temp) { result in
            if temp == 0 {
                self.pokemons = result
            } else {
                self.pokemons = self.pokemons + result
            }
            self.totalItems = self.pokemons.count
            self.tableview.reloadData()
            
        }
        self.page += 1
    }
}


class MyCustomTableViewCell: UITableViewCell {
    @IBOutlet weak var sprite: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var elementLbl: UILabel!
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyCustomTableViewCell
        
        if let myPokemon = pokemons[indexPath.row] {
            if let myImageURL = URL(string: myPokemon.sprites.frontDefault ?? "") {
                cell.sprite.getImage(from: myImageURL)
            }
            cell.nameLbl.text = myPokemon.species.name
            cell.nameLbl.adjustsFontSizeToFitWidth = true
            cell.elementLbl.text = myPokemon.types[0].type.name
            cell.elementLbl.adjustsFontSizeToFitWidth = true
        }
        
        if indexPath.row == pokemons.count - 1 { // last cell
            print("LOADING")
            if totalItems >= pokemons.count { // more items to fetch
                print("LOADING")
                load(offset: 10) // increment `fromIndex` by 20 before server call
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DetailViewController()
        controller.myPokemon = pokemons[indexPath.row]
        self.performSegue(withIdentifier: "toDetail", sender: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailViewController{
            let selectedRow = sender as? Int
            if let myPokemon = pokemons[selectedRow ?? 0]  {
                destination.myPokemon = myPokemon
            }
        }
    }
    
    

}


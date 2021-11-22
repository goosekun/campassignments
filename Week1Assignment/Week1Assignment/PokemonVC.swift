//
//  ViewController.swift
//  Week1Assignment
//
//  Created by Field Employee on 11/22/21.
//

import UIKit

class PokemonVC: UIViewController {
    
    var tableView = UITableView()
    var pokemon: [Pokemon] = []
    let pokeCell = "pokeCell"

    override func viewDidLoad() {
        view.backgroundColor = .green
        title = "Your Pokemon"
        configureTableView()
        setTableViewDelegates()
        pokemon = fetchData()
        configureTableView()
        setTableViewDelegates()
        super.viewDidLoad()

    }

    func configureTableView() {
        //manually adding tableview to VC programmatically
        view.addSubview(tableView)
        tableView.rowHeight = 100
        //set delegates
        //set row height
        //register cells
        //set constraints
        tableView.register(PokemonViewCell.self, forCellReuseIdentifier: pokeCell)
        tableView.pin(view)
    }
    
    func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }

}

extension PokemonVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemon.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: pokeCell) as! PokemonViewCell
        let poke = pokemon[indexPath.row]
        cell.set(poke)
        
        return cell
    }
}

extension PokemonVC {
    
    func fetchData() -> [Pokemon] {
        let pokemon1 = Pokemon(name: "Flareon", image: Images.flareon)
        let pokemon2 = Pokemon(name: "Dratini", image: Images.dratini)
        let pokemon3 = Pokemon(name: "Typhlosion", image: Images.typhlosion)
        let pokemon4 = Pokemon(name: "Furret", image: Images.furret)
        let pokemon5 = Pokemon(name: "Pichu", image: Images.pichu)
        
        
        return [pokemon1, pokemon2, pokemon3, pokemon4, pokemon5]
    }
}



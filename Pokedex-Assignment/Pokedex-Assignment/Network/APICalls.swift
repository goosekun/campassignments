//
//  APICalls.swift
//  Pokedex-Assignment
//
//  Created by Field Employee on 12/6/21.
//

import Foundation

class APICalls {
//    static let shared = APICalls()
//    private(set) var pokemons:[Pokemon];
//    private(set) var dispatchGroup: DispatchGroup
//
//    private init() {
//        self.pokemons = [];
//        self.dispatchGroup = DispatchGroup()
//    }
    
    var dispatchGroup = DispatchGroup()

}


extension APICalls {
    func getPokemons(offset: Int = 0, _ completion: @escaping ([Pokemon]) -> Void) {
        URLSession.shared.dataTask(with: URL(string: APIEndpoints.pokemonAPI + "?offset=\(offset)&limit=30")!) { (data, response, error) in
            if let data = data {
                do {
                    let pok = try! JSONDecoder().decode(Root.self, from: data)
                    var pokListData: [Pokemon] = []
                    pok.results.forEach { (poke) in
                        self.dispatchGroup.enter()
                        URLSession.shared.dataTask(with: URL(string: poke.url!)!) { (data, response, error) in
                            if let data = data {
                                do {
                                    let pok = try! JSONDecoder().decode(Pokemon.self, from: data)
                                    pokListData.append(pok)
                                    self.dispatchGroup.leave()
                                }
                            }
                        }.resume()
                    }
                    /// Get all Data when dispatchGroup notify
                    self.dispatchGroup.notify(queue: .main) {
                        completion(pokListData)
                    }
                }
            }
            if let error = error {
                print(error.localizedDescription)
            }
        }.resume()
    }
}

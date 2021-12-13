//
//  Pokemon.swift
//  Pokedex-Assignment
//
//  Created by Field Employee on 12/3/21.
//

import Foundation

struct Root : Codable {
    private enum CodingKeys : String, CodingKey { case results = "results" }
    let results : [Pokedex]
}

struct Pokedex: Codable {
    let name, url: String?
}



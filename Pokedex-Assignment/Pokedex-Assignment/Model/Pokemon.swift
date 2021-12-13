//
//  PokemonDetails.swift
//  Pokedex-Assignment
//
//  Created by Field Employee on 12/3/21.
//

import Foundation

struct Pokemon: Codable {
    let abilities : [Ability]
    let moves : [Move]
    let sprites: Sprites
    let species: Species
    let types: [TypeElement]
}

struct Ability: Codable {
    let ability: Species
}

struct Species: Codable {
    let name: String?
    let url: String?
}

struct Move: Codable {
    let move: Species
}

struct Sprites: Codable {
    let frontDefault: String?
    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}

struct TypeElement: Codable {
    let slot: Int
    let type: Species
}

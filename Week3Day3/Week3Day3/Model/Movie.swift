//
//  Movie.swift
//  Week3Day3
//
//  Created by Field Employee on 12/1/21.
//

import Foundation

struct Root : Codable {
    private enum CodingKeys : String, CodingKey { case results = "results" }
    let results : [Movie]
}

struct Movie: Codable {
    let title: String
    let rating: Double
    let description: String
    let year: String
    let image: String

    enum CodingKeys: String, CodingKey {
        case title = "original_title"
        case rating = "vote_average"
        case description = "overview"
        case year = "release_date"
        case image = "poster_path"
    }
}

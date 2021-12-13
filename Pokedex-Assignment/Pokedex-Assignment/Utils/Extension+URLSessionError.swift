//
//  Extension+URLSessionError.swift
//  Pokedex-Assignment
//
//  Created by Field Employee on 12/3/21.
//

import Foundation

extension URLSession {
    enum RequestErrors: Error {
        case badURL
        case badData
    }
}

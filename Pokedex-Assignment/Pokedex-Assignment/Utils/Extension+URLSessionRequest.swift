//
//  Extension+URLSessionRequest.swift
//  Pokedex-Assignment
//
//  Created by Field Employee on 12/2/21.
//

import Foundation

extension URLSession {
    /*
     Here we are extending URLSession by adding a generic networking call func that does not worry about classes. The only thing it cares about that whatever is passed in conforms to Codable protocol.
     */
    
                    //anything that conforms to codable
    func getRequest<T:Codable>(url: URL?, decoding: T.Type, completion: @escaping (Result<T, Error>) -> ()) {
        guard let url = url else {
            completion(.failure(RequestErrors.badURL))
            return
        }
        
        let task = self.dataTask(with: url) { data, _, error in
            
            guard data != nil else {
                completion(.failure(RequestErrors.badData))
                return
            }
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            do {
                let jsonResult = try JSONDecoder().decode(decoding, from: data!)
                completion(.success(jsonResult))
            } catch {
                completion(.failure(error))
            }
            
        }
        task.resume()
    }
    
    
}

//
//  Extension+URLSessionRequest.swift
//  week3day2
//
//  Created by Field Employee on 12/2/21.
//

import Foundation

extension URLSession {
    
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

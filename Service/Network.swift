//
//  Network.swift
//  movies
//
//  Created by Muhammed Safa Ozdemir on 21.07.2024.
//

import Foundation

protocol NetworkServiceProtokol{
    func fetchData<T: Decodable>(_ endPoint: EndPoint, completion: @escaping (Result<T,Error>) -> Void)
}

final class Network: NetworkServiceProtokol {
    func fetchData<T: Decodable>(_ endPoint: EndPoint, completion: @escaping (Result<T,Error>) -> Void){
        let task = URLSession.shared.dataTask(with: endPoint.request()) { data, response, error in
            if let error = error {
                completion(.failure(error))
            }
            
            if let data = data {
                do {
                    let decoder = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(decoder))
                }catch let error {
                    print(error)
                }
            }
            
            
        }
        task.resume()
    }
}

//
//  NetworkService.swift
//  House
//
//  Created by  Mr.Ki on 12.12.2022.
//

import Foundation

struct NetworkService: NetworkServiceProtocol {
    
    func fetch<T: Decodable>(_ type: T.Type, urlRequest: URLRequest, completion: @escaping(Result<T, NetworkError>) -> Void) {
        
        let task = URLSession.shared.dataTask(with: urlRequest) {data, responce, error in
         
            if let error = error as? URLError {
                completion(Result.failure(NetworkError.url(error)))
            } else if let response = responce as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                completion(Result.failure(NetworkError.badResponse(statusCode: response.statusCode)))
            } else if let data = data {
                let decoder = JSONDecoder()
                
                do {
                   
                    let result = try decoder.decode(type, from: data)
                    completion(Result.success(result))
                } catch {
                    
                    completion(Result.failure(NetworkError.parsing(error as? DecodingError)))
                }
            }
        }
        task.resume()
    }
}


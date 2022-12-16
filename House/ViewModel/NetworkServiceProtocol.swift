//
//  NetworkServiceProtocol.swift
//  House
//
//  Created by  Mr.Ki on 12.12.2022.
//

import Foundation

protocol NetworkServiceProtocol {

    func fetch<T: Decodable>(_ type: T.Type, urlRequest: URLRequest, completion: @escaping(Result<T, NetworkError>) -> Void)

}



//
//  HouseFetcher.swift
//  House
//
//  Created by  Mr.Ki on 12.12.2022.
//

import Foundation
import SwiftUI


class HouseFetcher: ObservableObject {
   
    @Published var houses = [House]()
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    init() {
        fetchAllHouses()
    }
    //MARK: - Get all data
    func fetchAllHouses() {
        isLoading = true
        let service = NetworkService()
        guard let url = URL(string: Constants.baseURL + Constants.apiURL) else {return}
        var request = URLRequest(url: url)
        request.addValue(Constants.key, forHTTPHeaderField: "Access-Key")
        service.fetch([House].self, urlRequest: request) { [unowned self] result in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    print(error.description)
                    print(error)
                case .success(let houses):
                    self.houses = houses
                }
            }
        }
    }
    
    static func errorState() -> HouseFetcher {
        let fetcher = HouseFetcher()
        fetcher.errorMessage = NetworkError.url(URLError.init(.notConnectedToInternet)).localizedDescription
        return fetcher
    }
    
    static func successState() -> HouseFetcher {
        let fetcher = HouseFetcher()
        return fetcher
    }
}

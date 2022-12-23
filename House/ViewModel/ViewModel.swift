//
//  ViewModel.swift
//  House
//
//  Created by  Mr.Ki on 23.12.2022.
//

import Foundation
import Combine

/// View model 

class ViewModel: ObservableObject {
    @Published var houses: [House] = []
    var cansellables = Set<AnyCancellable>()
    var searchText: String = ""
    init() {
        getHouses()
    }
    //MARK: - Getting houses
    func getHouses() {
        guard let url = URL(string: Constants.baseURL + Constants.apiURL) else {return}
        var request = URLRequest(url: url)
        request.addValue(Constants.key, forHTTPHeaderField: "Access-Key")
        URLSession.shared.dataTaskPublisher(for: request)
        // subscibe on background thread
            .subscribe(on: DispatchQueue.global(qos: .background))
        // recive data on main thread
            .receive(on: DispatchQueue.main)
        // check that we get good data
            .tryMap(handleOutput)
        // decode data into House model
            .decode(type: [House].self, decoder: JSONDecoder())
        // replace data when something going wrong
            .replaceError(with: [])
        // put item into app
            .sink { (completion) in
                switch completion {
                case .finished:
                    print("Finished ✅")
                case .failure(let error):
                    print("Error ❌: \(error)")
                }
            } receiveValue: { [weak self] (returnedHouses) in
                self?.houses = returnedHouses
            }
            .store(in: &cansellables)
    }
    
    func handleOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard let responce = output.response as? HTTPURLResponse,
              responce.statusCode >= 200 && responce.statusCode < 300 else {
            throw URLError(.badServerResponse)
        }
        return output.data
    }
    //MARK: - Search bar logic
    var filtredHouses: [House] {
        if searchText.count < 2 {
            return houses.sorted {
                $0.price < $1.price }
        } else {
            return houses.filter { $0.city.contains(searchText) || $0.zip.contains(searchText) || ($0.city.contains(searchText) && $0.zip.contains(searchText)) }.sorted {
                $0.price < $1.price }
        }
    }
    
}


//
//  House.swift
//  House
//
//  Created by  Mr.Ki on 12.12.2022.
//

import Foundation

struct House: Codable, Identifiable {
   
    
    let id: Int
    let image: String 
    let price: Int
    let bedrooms: Int
    let size: Int
    let description: String
    let zip: String
    let city: String
    let latitude: Double
    let longitude: Double
    let createdDate: String
    
//    var imageRequest: URLRequest {
//        let url = URL(string: Constants.baseURL + image)
//        var request = URLRequest(url: (url ?? URL(string: "https://intern.d-tt.nl/api/house"))!)
//               request.addValue("98bww4ezuzfePCYFxJEWyszbUXc7dxRx", forHTTPHeaderField: "Access-Key")
//            
//            return request
//        
//    }
    
    static let mockHouse = House(id: 1, image: "/uploads/house1.jpg", price: 45000, bedrooms: 2, size: 46, description: "Home, sweet home", zip: "3781", city: "Bilthoven", latitude: 2.093001433747425, longitude: 5.12210238439808755, createdDate: "12.12.2022")

}

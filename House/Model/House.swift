//
//  House.swift
//  House
//
//  Created by  Mr.Ki on 12.12.2022.
//

import Foundation

protocol Housing {
    //
}

struct House: Codable, Identifiable, Housing {
   //MARK: - Data model
    
    let id: Int
    let image: String 
    let price: Int
    let bedrooms: Int
    let bathrooms: Int
    let size: Int
    let description: String
    let zip: String
    let city: String
    let latitude: Double
    let longitude: Double
    let createdDate: String
    
    // Mock data for preview mode
    static let mockHouse = House(id: 1, image: "/uploads/house1.jpg", price: 45000, bedrooms: 2, bathrooms: 1, size: 46, description: "Home, sweet home", zip: "3781", city: "Bilthoven", latitude: 2.093001433747425, longitude: 5.12210238439808755, createdDate: "12.12.2022")

}

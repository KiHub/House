//
//  DataManager.swift
//  House
//
//  Created by  Mr.Ki on 16.12.2022.
//

import Foundation
import CoreData

/// Core data logic

class DataManager: ObservableObject {
    let container = NSPersistentContainer(name: "Fav")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Load data error ❌ \(error.localizedDescription)")
            }
        }
    }
    
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
            print("Saved ✅")
        } catch {
            print("Data not saved ❌")
        }
    }
    
    func addHouse(id: Int64, image: String, price: Int64, bedrooms: Int64, bathrooms: Int64, size: Int64, description: String, zip: String, city: String, latitude: Double, longitude: Double, createdDate: String, context: NSManagedObjectContext) {
        let house = Item(context: context)
        house.id = id
        house.image = image
        house.price = price
        house.bedrooms = bedrooms
        house.bathrooms = bathrooms
        house.size = size
        house.description1 = description
        house.zip = zip
        house.city = city
        house.latitude = latitude
        house.longitude = longitude
        house.createdDate = createdDate
        house.date = Date()
        save(context: context)
    }
}

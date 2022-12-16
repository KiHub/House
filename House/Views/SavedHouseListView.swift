//
//  SavedHouseListView.swift
//  House
//
//  Created by  Mr.Ki on 16.12.2022.
//




import SwiftUI
import CoreData

struct SavedHouseListView: View {
    
    @Environment(\.managedObjectContext) var  managedObjectContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date)]) var house: FetchedResults<Item>
    
    var body: some View {
        NavigationView {
            List {
                if house.count != 0 {
                ForEach(house) { house in
                    
                    NavigationLink {
                       HouseDetailViewCD(house: house)
                    } label: {
                       HouseRowCD(house: house)
                    }
                }
                .onDelete(perform: deleteHouse)
                .listRowSeparator(.hidden)
                } else {
                    Text("Right here, you can save your favorite houses")
                        .font(.custom("GothamSSm-Light", size: 16))
                        .foregroundColor(Color("Medium"))
                    Text("Just push 🖤 on the house page")
                        .font(.custom("GothamSSm-Light", size: 16))
                        .listRowSeparator(.hidden)
                        .foregroundColor(Color("Medium"))
                }
            }
            .navigationTitle("Your favourite houses")
        }
    }
    //MARK: - Delete
    private func deleteHouse(offsets: IndexSet) {
        withAnimation {
            offsets.map { house[$0] }.forEach(managedObjectContext.delete)
            DataManager().save(context: managedObjectContext)
        }
    }
}

struct SavedHouseListVoew_Previews: PreviewProvider {
    static var previews: some View {
        SavedHouseListView()
    }
}

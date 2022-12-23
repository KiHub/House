//
//  HouseDetailViewCD.swift
//  House
//
//  Created by  Mr.Ki on 16.12.2022.
//

import SwiftUI
/**
 This is HouseDetailViewCD
 Here I create layout with detail information for saved huses
*/
struct HouseDetailViewCD: View {
    
    @Environment (\.managedObjectContext) var managedObjectContext
    @StateObject var locationManager = LocationManager()
    @Environment(\.presentationMode) var presentatiomMode
    @Environment(\.dismiss) var dismiss
    let house: FetchedResults<Item>.Element
    let imageSize: CGFloat = 150
    let scale: CGFloat = 1
    
    var body: some View {
        //MARK: - Datail layout
        ZStack(alignment: .topLeading) {
            VStack {
                ScrollView {
                    VStack(spacing: -30) {
                        imageSection
                            .ignoresSafeArea()
                        VStack(alignment: .leading, spacing: 20) {
                            titleSection
                            Text("Description")
                                .font(.custom("GothamSSm-Medium", size: 16))
                            descriptionSection
                            Text("Location")
                                .font(.custom("GothamSSm-Medium", size: 16))
                            mapView
                            //MARK: - Navigation
                                .onTapGesture {
                                    navigation()
                                }
                        }
                        .padding()
                        .background(Color("LightGray"))
                        .cornerRadius(20)
                    }
                }
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
                .ignoresSafeArea()
                .background(Color("LightGray"))
            }
            //MARK: - Back button
            .overlay(alignment: .topLeading) {
                backButton
            }
        }
        .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
            .onEnded({ value in
                
                if value.translation.width > 0 {
                    dismiss()
                }
            }))
    }
}

//
//  HouseCardView.swift
//  House
//
//  Created by  Mr.Ki on 12.12.2022.
//

import SwiftUI

struct HouseCardView: View {
    let house: House
    let imageSize: CGFloat = 100
    
    @State private var myImage: UIImage? = nil
    
    let scale: CGFloat = 0.9
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)

}
}
struct HouseCardView_Previews: PreviewProvider {
    static var previews: some View {
        HouseCardView(house: House.mockHouse)
    }
}

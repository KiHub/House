//
//  NoResultView.swift
//  House
//
//  Created by  Mr.Ki on 12.12.2022.
//

import SwiftUI

struct NoResultView: View {
    var body: some View {
        //MARK: - If no results found
        VStack {
            Image("undraw_empty_xct9-2")
                .resizable()
                .scaledToFit()
                .background(Color.clear)
                .padding()
                .padding()
        Text("No results found")
            Text("Perhaps try another search?")
        }
        .font(.custom("GothamSSm-Light", size: 16))
        .foregroundColor(Color("Light"))
    }
}

struct NoResultView_Previews: PreviewProvider {
    static var previews: some View {
        NoResultView()
    }
}

//
//  AboutView.swift
//  House
//
//  Created by  Mr.Ki on 13.12.2022.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        //MARK: - All about app
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 20) {
                Text("About")
                    .font(.custom("GothamSSm-Bold", size: 18))
                    .foregroundColor(Color("Strong"))
                // some information
                Text("DTT is not your average software development company because besides technical knowledge we also have a solid marketing background. With passion, we work on a perfect mix of technology, strategy, and creativity. DTT was established in 2010, and in a short period we have made significant steps forward; a substantial portfolio, excellent credentials, respectable clients, and most importantly a competent and driven team.")
                    .font(.custom("GothamSSm-Book", size: 12))
                    .foregroundColor(Color("Medium"))
                
                Text("Design and Development")
                    .font(.custom("GothamSSm-Bold", size: 18))
                    .foregroundColor(Color("Strong"))
                HStack(spacing: 30) {
                    Image("dtt_logo")
                    VStack(alignment: .leading) {
                        Text("by DTT")
                            .font(.custom("GothamSSm-Medium", size: 16))
                            .foregroundColor(Color("Strong"))
                        Link("d-tt.nl", destination: URL(string: "https://www.d-tt.nl/en/")!)
                        
                    }
                }
                Spacer()
            }
            Spacer()
        }
        .padding(.top, 40)
        .padding()
        .background(Color("LightGray"))
        .ignoresSafeArea()
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}

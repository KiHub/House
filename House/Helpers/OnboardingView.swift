//
//  OnboardingView.swift
//  House
//
//  Created by  Mr.Ki on 15.12.2022.
//

import SwiftUI

struct OnboardingView: View {
    @ObservedObject var global = Global()
    var data: OnboardingData
    @State private var isAnimating: Bool = false
    var body: some View {
        ZStack {
            VStack {
                Image(data.objectImage)
                    .resizable()
                    .scaledToFit()
                    .scaleEffect(isAnimating ? 0.3 : 0.1)
            Text(data.primaryText)
                .font(.custom("GothamSSm-Medium", size: 16))
                .foregroundColor(Color("Strong"))
                .padding()
   
            }
            Spacer()
            VStack {
                Spacer()
                HStack(alignment: .bottom) {
                Button(action: {
                    global.onboardingOn = false
                }, label: {
                    Text("Get Started")
                        .font(.custom("GothamSSm-Light", size: 14))
                        .foregroundColor(.white)
                        .padding(.horizontal, 50)
                        .padding(.vertical, 16)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(Color("Strong")
                                )
                        )
                })
                .opacity(data.on ? 1.0 : 0.0)
                .padding(.vertical, 40)
                .padding()
                }
            }
        }
        .onAppear(perform: {
            isAnimating = false
            withAnimation(.easeOut(duration: 0.5)) {
                self.isAnimating = true
            }
        })
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(data: OnboardingData.list.first!)
    }
}

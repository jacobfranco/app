//
//  Home.swift
//  ApolloAlpha
//
//  Created by Jacob Franco on 4/19/22.
//

import SwiftUI

//Home View -- Landing page after opening app if not signed in
struct Welcome : View {
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
            VStack {
                
                VStack {
                    
                    Spacer()
                    
                    Image("Logo")
                    
                    Text("Welcome to Apollo")
                        .padding(5)
                        .foregroundColor(Color.white)
                        .font(Font.custom("URWDIN-Light", size: 36))
                    Text("The eSports Frontier")
                        .foregroundColor(Color.white)
                        .font(Font.custom("URWDIN-Light", size: 20))
                    Spacer()
                    
                }.frame(height: UIScreen.main.bounds.height * 2 / 3)
                
                VStack {
                    NavigationLink(destination: PhoneSignup(), label: {
                        Text("Log In")
                            .foregroundColor(Color("GoldColor"))
                            .padding(.vertical, 18)
                            .padding(.horizontal, 75)
                            .font(Font.custom("URWDIN-Light", size: 20))
                            .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color("GoldColor"), lineWidth: 1)
                        )
                    })
                    .padding()
                    NavigationLink(destination: AgeVerification(), label: {
                        Text("Create an Account")
                            .foregroundColor(Color("GoldColor"))
                            .padding(.vertical, 18)
                            .padding(.horizontal, 50)
                            .font(Font.custom("URWDIN-Light", size: 20))
                            .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color("GoldColor"), lineWidth: 1)
                        )
                    })
                    .padding()
                    
                    Spacer()
                    
                }
                .frame(height: UIScreen.main.bounds.height / 3)
            }
            .navigationTitle("")
            .navigationBarHidden(true)
        }
        .preferredColorScheme(.dark)
        
        
    }
    
}

struct Welcome_Previews: PreviewProvider {
    static var previews: some View {
        Welcome()
    }
}

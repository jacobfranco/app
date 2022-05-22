//
//  ProfileDetails.swift
//  ApolloAlpha
//
//  Created by Jacob Franco on 4/26/22.
//

import SwiftUI
import Passbase


struct AgeVerification: View {
    @AppStorage("verify_status") var verified = false
    
    var body: some View {
        ZStack {
            
            Color("BackgroundColor")
                .ignoresSafeArea()
            
            VStack {
                
                VStack {
                    
                    VStack {
                        
                        VStack {
                            
                            NavigationLink(destination: Welcome()) {
                                Image("BackArrow")
                                    .frame(width: UIScreen.main.bounds.width - 50, alignment: .leading)
                                    .padding(.bottom, 75)
                            }
                            
                            .animation(.easeOut)
                            //Main label
                            Text("First, let's verify your ID")
                                .foregroundColor(Color.white)
                                .font(Font.custom("URWDIN-Light", size: 30))
                            //Subtitle
                            Text("You must be of legal fantasy age where you live")
                                .padding(.top, 5)
                                .foregroundColor(Color.white)
                                .font(Font.custom("URWDIN-Light", size: 16))
                            
                        }
                        
                        .frame(height: UIScreen.main.bounds.height / 4)
                        
                        Spacer()
                    }
                    
                    
                    
                    PassBaseView()
                }
                //Terms and Conditions
                
                VStack(alignment: .center) {
                    Text("You must comply with local laws related to playing daily fantasy sports.  You must be at least 18 years of age to play, with some states requiring you to be older.  Users may not sign up if they are from the following states: Arizona, Iowa, Louisiana, or Washington.")
                        .foregroundColor(Color.white)
                        .font(Font.custom("URWDIN-Light", size: 12))
                        .padding()
                        .multilineTextAlignment(.center)
                }
                
                    
            }
            .navigationTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            
            if verified {
                
                ProfileDetails()
                
            }
            
            
           
        }
        
        
    }
}

struct AgeVerification_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AgeVerification()
        }
    }
}


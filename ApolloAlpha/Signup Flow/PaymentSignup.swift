//
//  PaymentSignup.swift
//  ApolloAlpha
//
//  Created by Jacob Franco on 5/17/22.
//

import SwiftUI

struct PaymentSignup: View {
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
            VStack {
                
                
                VStack {
                    
                    NavigationLink(destination: ProfileDetails()) {
                        Image("BackArrow")
                            .frame(width: UIScreen.main.bounds.width - 50, alignment: .leading)
                            .padding(.bottom, 75)
                    }
                    .animation(.easeOut)
                    //Main label
                    Text("Add a payment method")
                        .foregroundColor(Color.white)
                        .font(Font.custom("URWDIN-Light", size: 30))
                    //Subtitle
                    Text("This is optional for now and can be accessed in settings")
                        .padding(.top, 5)
                        .foregroundColor(Color.white)
                        .font(Font.custom("URWDIN-Light", size: 16))
                    
                }
                .frame(height: UIScreen.main.bounds.height / 4)
                
                //Main Contents
                VStack(alignment: .leading) {
                    
                        //TODO: Payment Options
                        VStack {
                            ZStack(alignment: .leading) {
                                
                                Text("Credit/Debit Card")
                                .foregroundColor(Color.white)
                                .font(Font.custom("URWDIN-Light", size: 18))
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 5)
                                        .foregroundColor(Color("BlockColor")).opacity(0.5)
                                )
                            }
                            
                        }
                        .padding()
                    
                    
                    VStack {
                        HStack {
                            
                            
                            Text("Crypto")
                                .padding()
                                .foregroundColor(Color.white)
                                .font(Font.custom("URWDIN-Light", size: 18))
                            
                            Spacer()
                            
                            
                        }
                        .background(
                            RoundedRectangle(cornerRadius: 5)
                                .foregroundColor(Color("BlockColor")).opacity(0.5)
                        )
                    }
                   
                    .padding()
                   
                
                }
                .frame(height: UIScreen.main.bounds.height / 4)
                
                
                
                //Continue Button
                NavigationLink(destination: PhoneSignup()) {
                    
                    Text("Continue")
                        .foregroundColor(Color("GoldColor"))
                        .padding(.vertical, 18)
                        .padding(.horizontal, 38)
                        .font(Font.custom("URWDIN-Light", size: 20))
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color("GoldColor"), lineWidth: 1)
                        )
                    
                }
                
                Spacer()
                
                
            }
            .navigationTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            
        }
        
    }
}

struct PaymentSignup_Previews: PreviewProvider {
    static var previews: some View {
        PaymentSignup()
    }
}

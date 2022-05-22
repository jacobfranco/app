//
//  PhoneSignup.swift
//  ApolloAlpha
//
//  Created by Jacob Franco on 4/19/22.
//

import SwiftUI

struct PhoneSignup: View {
    @StateObject var loginData = PhoneSignupModel()
    var body: some View {
        
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
            VStack {
                
           
                VStack {
                    
                    NavigationLink(destination: PaymentSignup()) {
                        Image("BackArrow")
                            .frame(width: UIScreen.main.bounds.width - 50, alignment: .leading)
                            .padding(.bottom, 75)
                    }
                    .animation(.easeOut)
                    //Main label
                    Text("Enter your phone number")
                        .foregroundColor(Color.white)
                        .font(Font.custom("URWDIN-Light", size: 30))
                    //Subtitle
                    Text("A code will be sent to you for verification")
                        .padding(.top, 5)
                        .foregroundColor(Color.white)
                        .font(Font.custom("URWDIN-Light", size: 16))
                    
                }
                .frame(height: UIScreen.main.bounds.height / 4)
                    
                    //Mobile Number Field
                    VStack {
                        HStack {
                            
                            Spacer()
                            //Enter your number field
                            VStack(alignment: .center, spacing: 6){
                                Text("+ \(loginData.getCountryCode()) \(loginData.phoneNumber)")
                                    .foregroundColor(Color.white)
                                    .font(Font.custom("URWDIN-Light", size: 28))
                                    .padding(.bottom, 100)
                                
                            }
                            
                            Spacer(minLength: 0)
                            
                        }
                        .padding()
                    }
                    .frame(height: UIScreen.main.bounds.height / 4)
                   
                
                
                //Continue Button
                NavigationLink(destination: Verification(loginData: loginData), isActive: $loginData.goToVerify) {
                    
                    Text("")
                        .hidden()
                    
                    Button(action: loginData.sendCode, label: {
                        
                        Text("Continue")
                            .foregroundColor(Color("GoldColor"))
                            .padding(.vertical, 18)
                            .padding(.horizontal, 38)
                            .font(Font.custom("URWDIN-Light", size: 20))
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color("GoldColor"), lineWidth: 1)
                            )
                    })
                }
                .disabled(loginData.phoneNumber == "" ? true : false)
                
                //Custom Keyboard
                CustomNumberKeyboard(value: $loginData.phoneNumber, isVerify: false)
                
            }
            .navigationTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            
            if loginData.error {
                
                AlertView(msg: loginData.errorMessage, show: $loginData.error)
            }
        }
        
    }
    
}


struct PhoneSignup_Previews: PreviewProvider {
    static var previews: some View {
        PhoneSignup()
    }
}

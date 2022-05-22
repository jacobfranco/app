//
//  Verification.swift
//  ApolloAlpha
//
//  Created by Jacob Franco on 4/19/22.
//

import SwiftUI

struct Verification: View {
    @ObservedObject var loginData : PhoneSignupModel
    @Environment(\.presentationMode) var present
    var body: some View {
        
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
            
            VStack {

                
                VStack {
                    
                    NavigationLink(destination: PhoneSignup()) {
                        Image("BackArrow")
                            .frame(width: UIScreen.main.bounds.width - 50, alignment: .leading)
                            .padding(.bottom, 75)
                    }
                
                    //Main label
                    Text("Verify Phone Number")
                        .foregroundColor(Color.white)
                        .font(Font.custom("URWDIN-Light", size: 30))
                    //Subtitle
                    
                    if loginData.loading{ProgressView()}
                    
                    Text("Your code was sent to \(loginData.phoneNumber)")
                        .foregroundColor(Color.white)
                        .padding(.top, 5)
                        .font(Font.custom("URWDIN-Light", size: 16))
                    
                }
                .frame(height: UIScreen.main.bounds.height / 4)
                
                VStack {
                    HStack(spacing: 15) {
                        
                        ForEach(0..<6, id: \.self) { index in
                            
                            CodeView(code: getCodeAtIndex(index: index))
                            
                        }
                    }
                    .padding()
                    
                    
                    HStack(spacing: 6) {
                        
                        Text("Didn't receive code?")
                            .foregroundColor(Color.white)
                            .font(Font.custom("URWDIN-Light", size: 14))
                        
                        Button(action: loginData.requestCode) {
                            
                            Text("Request again")
                                .foregroundColor(Color("GoldColor"))
                                .font(Font.custom("URWDIN-Light", size: 14))
                        }
                        
                        .padding()
                        
                    }
                    .padding()
                    
                }
            
                .frame(height: UIScreen.main.bounds.height / 4)
                
                
                //Continue Button
                Button(action: loginData.verifyCode) {
                    
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
                
                //CustomKeyboard
                CustomNumberKeyboard(value: $loginData.code, isVerify: true)
            }
            
            if loginData.error {
                AlertView(msg: loginData.errorMessage, show: $loginData.error)
            }
            
        }
        
        //navigation bar stuff
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        
    }
    
    
    func getCodeAtIndex(index: Int)->String {
        
        if loginData.code.count > index {
            
            let start = loginData.code.startIndex
            let current = loginData.code.index(start, offsetBy: index)
            
            return String(loginData.code[current])
        }
        
        return ""
    }
    
}

struct CodeView : View {
    
    var code : String
    var body: some View {
        
        VStack(spacing: 10) {
            
            Text(code)
                .foregroundColor(Color.white)
                .font(Font.custom("URWDIN-Light", size: 24))
                
                //default frame
                .frame(height: 45)
            
            Capsule()
                .fill(Color("HighlightColor"))
                .frame(height: 2)
        }
        
    }
}

struct Verification_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Verification(loginData: PhoneSignupModel())
        }
    }
}

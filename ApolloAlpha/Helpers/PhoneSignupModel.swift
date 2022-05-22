//
//  PhoneSignupModel.swift
//  ApolloAlpha
//
//  Created by Jacob Franco on 4/19/22.
//

import SwiftUI
import Firebase

class PhoneSignupModel: ObservableObject {

    @Published var phoneNumber = ""
    @Published var code = ""
    
    @Published var errorMessage = " "
    @Published var error = false
    
    @Published var CODE = ""
    
    @Published var goToVerify = false
    
    @AppStorage("log_status") var status = false
    
    @Published var loading = false

    
    func getCountryCode() -> String {
        
        let regionCode = Locale.current.regionCode ?? ""
        return countries[regionCode] ?? ""
    }
    
    func sendCode() {
        
        //DISABLE WHEN TESTING ON REAL DEVICE********
        //Auth.auth().settings?.isAppVerificationDisabledForTesting = true
        
        let number = "+\(getCountryCode())\(phoneNumber)"
        PhoneAuthProvider.provider().verifyPhoneNumber(number, uiDelegate: nil) {
            (CODE, err) in
            
            if let error = err {
                
                self.errorMessage = error.localizedDescription
                withAnimation{self.error.toggle()}
                return
            }
            
            self.CODE = CODE!
            self.goToVerify = true
        }
        
    }
    
    func verifyCode() {
        
        loading = true
        
        let credential = PhoneAuthProvider.provider().credential(withVerificationID: self.CODE, verificationCode: code)
        
        Auth.auth().signIn(with: credential) { (result, err) in
            
            self.loading = false
            
            if let error = err {
                self.errorMessage = error.localizedDescription
                withAnimation{self.error.toggle()}
                return
            }
            
            withAnimation{self.status = true}
        }
    }
    
    func requestCode() {
        sendCode()
        withAnimation {
            self.errorMessage = "Code sent successfully."
            self.error.toggle()
        }
    }
}

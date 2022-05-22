//
//  Home.swift
//  ApolloAlpha
//
//  Created by Jacob Franco on 4/19/22.
//

import SwiftUI
import Firebase

struct Home: View {
    @AppStorage("log_status") var status = false
    var body: some View {
        
        VStack {
            
            Text("Logged in successfully")
                .padding()
            Button(action: {
                try? Auth.auth().signOut()
                withAnimation{status = false}
            }, label: {
                Text("Log Out")
                    .foregroundColor(.white)
            })
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

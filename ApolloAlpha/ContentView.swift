//
//  ContentView.swift
//  ApolloAlpha
//
//  Created by Jacob Franco on 4/19/22.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("log_status") var status = false
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
            if status {
                Home()
            } else {
                NavigationView {
                    Welcome()
                        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
                        .navigationBarHidden(true)
                        .navigationBarBackButtonHidden(true)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

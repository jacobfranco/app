//
//  ProfileDetails.swift
//  ApolloAlpha
//
//  Created by Jacob Franco on 5/9/22.
//

import SwiftUI

struct ProfileDetails: View {
    @State var username: String = ""
    @State var changeProfileImage = false
    @State var openCameraRoll = false
    @State var imageSelected = UIImage()
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
            VStack {
                
                
                VStack {
                    
                    NavigationLink(destination: Welcome()) {
                        Image("BackArrow")
                            .frame(width: UIScreen.main.bounds.width - 50, alignment: .leading)
                            .padding(.bottom, 75)
                    }
                    .animation(.easeOut)
                    //Main label
                    Text("Let's get some information")
                        .foregroundColor(Color.white)
                        .font(Font.custom("URWDIN-Light", size: 30))
                    //Subtitle
                    Text("You can change these later in settings")
                        .padding(.top, 5)
                        .foregroundColor(Color.white)
                        .font(Font.custom("URWDIN-Light", size: 16))
                    
                }
                .frame(height: UIScreen.main.bounds.height / 4)
                
                //Main Contents
                VStack(alignment: .leading) {
                    
                        //Username field
                        VStack {
                            ZStack(alignment: .leading) {
                                
                                if username.isEmpty {
                                    Text("Username")
                                        .foregroundColor(Color.white)
                                        .padding()
                                        .font(Font.custom("URWDIN-Light", size: 18))
                                    
                                }
                                TextField(
                                    "",
                                    text: $username
                                )
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
                    
                    
                    //Add Profile Picture Button
                    
                    VStack {
                        HStack {
                            
                            
                            Text("Select profile picture")
                                .padding()
                                .foregroundColor(Color.white)
                                .opacity(0.5)
                                .font(Font.custom("URWDIN-Light", size: 18))
                            
                            Spacer()
                            
                            ZStack {
                                Button(action: {
                                    changeProfileImage = true
                                    openCameraRoll = true
                                    
                                }, label: {
                                       
                                Image("ForwardArrow")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .clipShape(Circle())
                                    .opacity(0.5)
                                    
                                })
                                
                            }.sheet(isPresented: $openCameraRoll) {
                                ImagePicker(selectedImage: $imageSelected, sourceType: .photoLibrary)
                            }
                            
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
                NavigationLink(destination: PaymentSignup()) {
                    
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

struct ProfileDetails_Previews: PreviewProvider {
    static var previews: some View {
        ProfileDetails()
    }
}

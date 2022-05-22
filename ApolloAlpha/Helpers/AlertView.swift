//
//  AlertView.swift
//  ApolloAlpha
//
//  Created by Jacob Franco on 4/19/22.
//

import SwiftUI

struct AlertView: View {
    
    var msg: String
    @Binding var show: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15, content: {
            Text("Message")
                .fontWeight(.bold)
                .foregroundColor(.gray)
            Text(msg)
                .foregroundColor(.gray)
            Button(action: {
                show.toggle()
            }, label: {
                Text("Close")
                    .foregroundColor(.black)
                    .padding(.vertical)
                    .background(Color.white)
                    .cornerRadius(15)
            })
            
            .frame(alignment: .center)
            
        })
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .padding(.horizontal, 25)
        
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.opacity(0.3).ignoresSafeArea())
    }
}

/* struct AlertView_Previews: PreviewProvider {
    static var previews: some View {
        AlertView()
    }
}
*/

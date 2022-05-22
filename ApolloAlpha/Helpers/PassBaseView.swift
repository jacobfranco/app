//
//  PassBaseView.swift
//  ApolloAlpha
//
//  Created by Jacob Franco on 5/9/22.
//

import SwiftUI
import Passbase

struct PassBaseView : UIViewControllerRepresentable {
    typealias UIViewControllerType = PBViewController

    func makeUIViewController(context: Context) -> PBViewController {
        return PBViewController()
    }

    func updateUIViewController(_ uiViewController: PBViewController, context: Context) {
        /* code here to make changes to the view controller if necessary when this view is updated*/
    }
}

struct PassBaseView_Previews: PreviewProvider {
    static var previews: some View {
        PassBaseView()
    }
}

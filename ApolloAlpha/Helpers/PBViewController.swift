//
//  PBViewController.swift
//  ApolloAlpha
//
//  Created by Jacob Franco on 5/9/22.
//

import Passbase
import UIKit
import SwiftUI

class PBViewController: UIViewController, PassbaseDelegate {
    
@AppStorage("verify_status") var verified = false
    
override func viewDidLoad() {
    super.viewDidLoad()
    PassbaseSDK.delegate = self
    // Optional - You can prefill the email to skip that step.
    // Passbase.prefillUserEmail = "testuser@yourproject.com"
    let button = PassbaseButton(frame: CGRect(x: 40, y: 90, width: 300, height: 60))
    self.view.frame.size.width = 300
    self.view.frame.size.height = 60
    self.view.addSubview(button)
}

func onFinish(identityAccessKey: String) {
  print("onFinish with identityAccessKey \(identityAccessKey)")
    self.verified.toggle()
}

func onSubmitted(identityAccessKey: String) {
  print("onSubmitted with identityAccessKey \(identityAccessKey)")
}

func onError(errorCode: String) {
  print("onError with code \(errorCode)")
}

func onStart() {
  print("onStart")
}
}

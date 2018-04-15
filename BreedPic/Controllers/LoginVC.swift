//
//  LoginVC.swift
//  BreedPic
//
//  Created by Eduard Moya on 4/14/18.
//  Copyright © 2018 Eduard Moya. All rights reserved.
//

import UIKit
import GoogleSignIn

class LoginVC: UIViewController {

    @IBOutlet weak var btnLogin: GIDSignInButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        GIDSignIn.sharedInstance().uiDelegate = self
        view.backgroundColor = UIColor.init(red: 180/255, green: 238/255, blue: 180/255, alpha: 1.0)
        btnLogin.colorScheme = .light
        btnLogin.style = .wide
    }
}

extension LoginVC: GIDSignInUIDelegate {

}

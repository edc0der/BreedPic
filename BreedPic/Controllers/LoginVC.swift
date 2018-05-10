//
//  LoginVC.swift
//  BreedPic
//
//  Created by Eduard Moya on 4/14/18.
//  Copyright © 2018 Eduard Moya. All rights reserved.
//

import UIKit
import GoogleSignIn

//TODO: Modify view to be more appealing -- Add colors not just black and white
class LoginVC: UIViewController, GIDSignInUIDelegate {

    @IBOutlet weak private var btnLogin: GIDSignInButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        prepareUI()
        GIDSignIn.sharedInstance().uiDelegate = self
        SessionManager.shared.delegate = self

        if !GIDSignIn.sharedInstance().hasAuthInKeychain() {
            return
        }
        //TODO: Let user know of this sign in
        //TODO: lock screen against another sign in
        GIDSignIn.sharedInstance().signInSilently()
    }

    func prepareUI() -> Void {
        view.backgroundColor = UIColor.init(red: 180/255, green: 238/255, blue: 180/255, alpha: 1.0)
        btnLogin.colorScheme = .light
        btnLogin.style = .wide
    }
}

extension LoginVC: SessionManagerDelegate {
    func sessionManager(didLogin success: Bool, _ error: Error?) {
        if let error = error {
            print("Error performing login: \(error.localizedDescription)")
            return
        }
        let mainController = UIStoryboard.mainNavigationController()
        mainController.setAsRoot()
    }
}

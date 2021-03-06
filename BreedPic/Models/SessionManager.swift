//
//  SessionManager.swift
//  BreedPic
//
//  Created by Eduard Moya on 4/15/18.
//  Copyright © 2018 Eduard Moya. All rights reserved.
//

import Foundation
import GoogleSignIn

protocol SessionManagerDelegate {
    func sessionManager(didLogin success: Bool, _ error: Error?) -> Void
    func sessionManager(didLogout success: Bool, _ error: Error?) -> Void
}

extension SessionManagerDelegate {
    func sessionManager(didLogout success: Bool, _ error: Error?) -> Void { }
}

class SessionManager: NSObject {
    static let shared = SessionManager()
    private override init() {
        super.init()
        self.getUserFromDefaults()
    }

    private let userKey = "CurrentUser"
    public var currentUser: UserProfile?
    public var delegate: SessionManagerDelegate?
    public var authToken: String?

    public func prepareForGoogleSignIn() -> Void {
        GIDSignIn.sharedInstance().clientID = "1062719120407-tm4cshsg5a5gc165qn5ugjuqjlol5v0h.apps.googleusercontent.com"
        GIDSignIn.sharedInstance().delegate = self
    }

//    public func presentLoginScreen(animated: Bool? = false) {
//        let viewController = LoginVC(nibName: String.className(target: LoginVC.self), bundle: nil)
//        viewController.setAsRoot()
//    }

    public func pushLoginScreen(animated: Bool? = false) {
        let viewController = LoginVC(nibName: String.className(target: LoginVC.self), bundle: nil)
        viewController.setAsRoot()
    }

    func isSignedIn() -> Bool {
        return GIDSignIn.sharedInstance().hasAuthInKeychain() && currentUser != nil
    }

    func userHasSeenOnboarding() -> Bool {
        guard let user = currentUser else {
            return false
        }
        return user.hasSeenOnboarding
    }

    func isSilentLogInNeeded() -> Bool {
        return GIDSignIn.sharedInstance().hasAuthInKeychain()
    }

    func logOut() -> Void {
        GIDSignIn.sharedInstance().signOut()
        pushLoginScreen()
//        presentLoginScreen()
    }

    func persistCurrentUser() -> Void {
        if let user = currentUser, let userData = user.safeEncode() {
            UserDefaults.standard.set(userData, forKey: userKey)
        }
    }

    private func getUserFromDefaults() -> Void {
        if let userData = UserDefaults.standard.data(forKey: userKey) {
            do {
                let decoder = JSONDecoder()
                currentUser = try decoder.decode(UserProfile.self, from: userData)
            } catch let error {
                print("\(error.localizedDescription)")
            }
        }
    }
}

extension SessionManager: GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            print("\(error.localizedDescription)")
            delegate?.sessionManager(didLogin: false, error)
        } else {
            let id = ID(name: "user.userID", value: user.userID)
            let name = Name(firstName: user.profile.givenName, lastName: user.profile.familyName)
            let pictures = Picture(thumbnailURL: user.profile.imageURL(withDimension: Picture.PictureSize.small.rawValue),
                                   mediumURL: user.profile.imageURL(withDimension: Picture.PictureSize.medium.rawValue),
                                   largeURL: user.profile.imageURL(withDimension: Picture.PictureSize.large.rawValue))

            currentUser = UserProfile(id: id,  name: name, picture: pictures, email: user.profile.email)
            authToken = user.authentication.idToken

            delegate?.sessionManager(didLogin: true, nil)
        }
    }

    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            print("\(error.localizedDescription)")
            delegate?.sessionManager(didLogout: false, error)
            return
        }
        currentUser = nil
        delegate?.sessionManager(didLogout: true, nil)
    }
}

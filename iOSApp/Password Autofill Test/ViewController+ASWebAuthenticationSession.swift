//
//  ViewController+ASWebAuthenticationSession.swift
//  Password Autofill Test
//
//  Created by Basem Emara on 2020-06-09.
//  Copyright © 2020 Basem Emara. All rights reserved.
//

import AuthenticationServices
import UIKit

extension ViewController {
    
    @IBAction func didTapLoginASWebAuthenticationSessionButton() {
        let session = ASWebAuthenticationSession(
            url: loginURL,
            callbackURLScheme: Self.callbackURLScheme) {
                print("ASWebAuthenticationSession login: \(String(describing: $0))", "\(String(describing: $1))")
        }
        
        session.prefersEphemeralWebBrowserSession = true
        session.presentationContextProvider = self
        session.start()
    }
    
    @IBAction func didTapSignupASWebAuthenticationSessionButton() {
        let session = ASWebAuthenticationSession(
            url: signupURL,
            callbackURLScheme: Self.callbackURLScheme) {
                print("ASWebAuthenticationSession signup: \(String(describing: $0))", "\(String(describing: $1))")
        }
        
        session.prefersEphemeralWebBrowserSession = true
        session.presentationContextProvider = self
        session.start()
    }
}

extension ViewController: ASWebAuthenticationPresentationContextProviding {
    
    func presentationAnchor(for session: ASWebAuthenticationSession) -> ASPresentationAnchor {
        view.window!
    }
}

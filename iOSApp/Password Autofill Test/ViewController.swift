//
//  ViewController.swift
//  Password Autofill Test
//
//  Created by Basem Emara on 2020-05-25.
//  Copyright © 2020 Basem Emara. All rights reserved.
//

import AuthenticationServices
import UIKit

class ViewController: UIViewController {
    private let callbackURLScheme = "customscheme"
}

private extension ViewController {
    
    @IBAction func didTapLoginButton() {
        let session = ASWebAuthenticationSession(
            url: URL(string: "https://zamzam.io/tests/autofill/login.html?callback_url_scheme=\(callbackURLScheme)")!,
            callbackURLScheme: callbackURLScheme) {
                print($0, $1)
        }
        
        session.prefersEphemeralWebBrowserSession = true
        session.presentationContextProvider = self
        session.start()
    }
    
    @IBAction func didTapSignupButton() {
        let session = ASWebAuthenticationSession(
            url: URL(string: "https://zamzam.io/tests/autofill/signup.html?callback_url_scheme=\(callbackURLScheme)")!,
            callbackURLScheme: callbackURLScheme) {
                print($0, $1)
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


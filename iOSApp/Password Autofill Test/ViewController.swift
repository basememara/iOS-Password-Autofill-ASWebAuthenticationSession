//
//  ViewController.swift
//  Password Autofill Test
//
//  Created by Basem Emara on 2020-05-25.
//  Copyright © 2020 Basem Emara. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    static let callbackURLScheme = "customscheme"
    
    lazy var loginURL = URL(string: "https://zamzam.io/tests/autofill/login.html?callback_url_scheme=\(Self.callbackURLScheme)")!
    lazy var signupURL = URL(string: "https://zamzam.io/tests/autofill/signup.html?callback_url_scheme=\(Self.callbackURLScheme)")!
    
    /// For `ASWebAuthenticationSession` implementation, see:
    /// `ViewController+ASWebAuthenticationSession.swift`
    
    /// For `SafariServices` implementation, see:
    /// `ViewController+Safari.swift`
}

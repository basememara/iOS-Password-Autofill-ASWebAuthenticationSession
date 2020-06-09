//
//  ViewController+Safari.swift
//  Password Autofill Test
//
//  Created by Basem Emara on 2020-06-09.
//  Copyright © 2020 Basem Emara. All rights reserved.
//

import SafariServices
import UIKit

extension ViewController {
    static var safariViewController: SFSafariViewController?
    
    @IBAction func didTapLoginSafariButton() {
        subscribe()
        
        Self.safariViewController = SFSafariViewController(url: loginURL)
        Self.safariViewController?.delegate = self
        Self.safariViewController?.modalPresentationStyle = .automatic
        Self.safariViewController?.dismissButtonStyle = .cancel
        present(Self.safariViewController!, animated: true)
    }
    
    @IBAction func didTapSignupSafariButton() {
        subscribe()
        
        Self.safariViewController = SFSafariViewController(url: signupURL)
        Self.safariViewController?.delegate = self
        Self.safariViewController?.modalPresentationStyle = .automatic
        Self.safariViewController?.dismissButtonStyle = .cancel
        present(Self.safariViewController!, animated: true)
    }
}

private extension ViewController {
    
    /// Listen to Safari redirect with auth code
    func subscribe() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(didReceiveAuthCode),
            name: .LoginDidReceiveAuthCode,
            object: nil
        )
    }
    
    /// Listening to the redirect URL fired from the app delegate.
    @objc func didReceiveAuthCode(_ notification: Notification) {
        NotificationCenter.default.removeObserver(self, name: .LoginDidReceiveAuthCode, object: nil)
        
        guard let url = notification.object as? URL else { return }
        print("Safari: \(url)")
        dismiss(animated: true)
    }
}

extension ViewController: SFSafariViewControllerDelegate {
    
    func safariViewController(_ controller: SFSafariViewController, didCompleteInitialLoad didLoadSuccessfully: Bool) {
        print("Safari: didCompleteInitialLoad: \(didLoadSuccessfully)")
    }
    
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        print("Safari: safariViewControllerDidFinish")
    }
}

extension NSNotification.Name {
    static let LoginDidReceiveAuthCode = Notification.Name("LoginDidReceiveAuthCode")
}

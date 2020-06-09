//
//  SceneDelegate.swift
//  Password Autofill Test
//
//  Created by Basem Emara on 2020-05-25.
//  Copyright © 2020 Basem Emara. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        guard let sourceApplication = URLContexts.first?.options.sourceApplication,
            String(describing: sourceApplication) == "com.apple.SafariViewService",
            let url = URLContexts.first?.url, url.absoluteString.hasPrefix(ViewController.callbackURLScheme) else {
                return
        }
        
        NotificationCenter.default.post(name: .LoginDidReceiveAuthCode, object: url)
    }
}

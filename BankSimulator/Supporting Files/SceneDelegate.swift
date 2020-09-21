//
//  SceneDelegate.swift
//  BankSimulator
//
//  Created by Metah on 8/13/20.
//  Copyright © 2020 devMetah. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
//        self.window = UIWindow(frame: UIScreen.main.bounds)
//
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        var initialVC: UIViewController!
//        if (UserDefaults.standard.value(forKey: "hasEntered") == nil) {
//            initialVC = storyboard.instantiateViewController(withIdentifier: "HowToViewController")
//        } else {
//            initialVC = storyboard.instantiateViewController(withIdentifier: "HomeViewController")
//        }
//        self.window?.rootViewController = storyboard.instantiateViewController(withIdentifier: "HowToViewController")
//        self.window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }
}


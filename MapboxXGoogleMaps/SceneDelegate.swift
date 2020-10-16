//
//  SceneDelegate.swift
//  MapboxXGoogleMaps
//
//  Created by Sebastian Osiński on 15/10/2020.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = MapboxViewController()
            self.window = window
            window.makeKeyAndVisible()
        }
    }
}


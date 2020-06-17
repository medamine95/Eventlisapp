//
//  SceneDelegate.swift
//  Eventlisapp
//
//  Created by MacBook Pro on 6/17/20.
//  Copyright © 2020 Mint. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var appCoordinator:Appcoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
     
        guard let scene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: scene)
        self.window = window
        
        self.appCoordinator = Appcoordinator(window: window)
        appCoordinator?.start()
    }

}


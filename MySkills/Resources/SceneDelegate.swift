//
//  SceneDelegate.swift
//  MySkills
//
//  Created by Nikita Evdokimov on 01.08.23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    let assembly = MainAssembly()
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.windowScene = windowScene
        
        assembly.createMainPresenter()
        window?.rootViewController = assembly.view
//        window?.rootViewController = MainViewController()
        
        window?.makeKeyAndVisible()
    }
    
}


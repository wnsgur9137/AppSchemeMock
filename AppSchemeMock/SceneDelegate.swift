//
//  SceneDelegate.swift
//  AppSchemeMock
//
//  Created by JunHyeok Lee on 1/25/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    let appDIContainer = AppDIContainer()
    var tabBarController: TabBarController?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let sceneDIContainer = appDIContainer.makeMainSceneDIContainer()
        tabBarController = sceneDIContainer.makeTabBarController()
        tabBarController?.start()
        
        /// NotRunning 상태일 때 실행
        if let urlContext = connectionOptions.urlContexts.first {
            deeplink(urlContext.url)
        }
        
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }
    
    /// Running 상태일 때 실행
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        guard let url = URLContexts.first?.url else { return }
        deeplink(url)
    }
}

// MARK: - Deeplink
extension SceneDelegate {
    private func deeplink(_ url: URL) {
        let host = url.host()
        switch host {
        case "home":
            tabBarController?.selected(page: .home)
            
        case "search":
            tabBarController?.selected(page: .search)
            
        case "setting":
            tabBarController?.selected(page: .setting)
            
        case "myPage":
            tabBarController?.selected(page: .myPage)
            
        default: break
        }
    }
    
    private func parsing(url: URLComponents,
                 itemKeys: [String]? = nil) -> [String: Any] {
        var urlItem = [String: Any]()
        let items = url.queryItems ?? []
        
        guard items.count >= 2 else {
            urlItem["res"] = "invalid type"
            return urlItem
        }
        guard let itemKeys = itemKeys else { return urlItem }
        for (index, itemKey) in itemKeys.enumerated() {
            urlItem[itemKey] = items[index].value
        }
        return urlItem
    }
}

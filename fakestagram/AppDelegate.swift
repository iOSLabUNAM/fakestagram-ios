//
//  AppDelegate.swift
//  fakestagram
//
//  Created by LuisE on 9/24/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        StorageType.permanent.ensureExists()
        StorageType.cache.ensureExists()
        loadOrCreateAccount()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    func loadOrCreateAccount() {
        if Credentials.apiToken.get() != nil { return }
        let account = Account(id: nil, name: "Jose Olvera", deviceNumber: UIDevice.identifier, deviceModel: UIDevice.modelName)
        let client = RestClient<Account>(client: Client.fakestagram, basePath: "/api/v1/accounts")
        client.create(account) { account in
            guard let account = account, let idx = account.id else { return }
            _ = Credentials.apiToken.set(value: idx)
        }
    }
}

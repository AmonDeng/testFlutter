//
//  AppDelegate.swift
//  testFlutter
//
//  Created by admin on 2020/11/30.
//

import UIKit
import Flutter
// Used to connect plugins (only if you have plugins with iOS platform code).
import FlutterPluginRegistrant

@main
class AppDelegate:FlutterAppDelegate {

 
    lazy var flutterEngine = FlutterEngine(name: "my flutter engine")
    override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        flutterEngine.run();
           // Used to connect plugins (only if you have plugins with iOS platform code).
           GeneratedPluginRegistrant.register(with: self.flutterEngine);
        window = UIWindow(frame: UIScreen.main.bounds)
        let vc = UINavigationController.init(rootViewController: ViewController())
        vc.navigationBar.isHidden = false
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        
        // Override point for customization after application launch.
        return true
    }

  

}


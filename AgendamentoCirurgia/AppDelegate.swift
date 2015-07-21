//
//  AppDelegate.swift
//  AgendamentoCirurgia
//
//  Created by Luisa Carvalho de Mendonça Ronchi on 13/07/15.
//  Copyright (c) 2015 BEPiD. All rights reserved.
//

import Parse
import Bolts
import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var navigationController: UINavigationController?


    func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool
    {
        // [Optional] Power your app with Local Datastore. For more info, go to
        // https://parse.com/docs/ios_guide#localdatastore/iOS
        Parse.enableLocalDatastore()

        // Initialize Parse.
        Parse.setApplicationId("G0eQ1jBAii4dkzxxtNU787eoBctpy4urYrPlG95b",
            clientKey: "oomRMLm1mx0QSra40nxBEKtSnrdFRhZpfpfPqbGr")
        
        // [Optional] Track statistics around application opens.
        PFAnalytics.trackAppOpenedWithLaunchOptions(launchOptions)
        
        // ...
        
        
        //Front
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        // Override point for customization after application launch.
        self.window!.backgroundColor = UIColor.whiteColor()
        self.window!.makeKeyAndVisible()
        
        // approach without storyboard
        // Step 1: create view controller instance
        // Step 2: create a navigation controller with view controller instance as root
        // Step 3: navigation controller instance is set as rootviewcontroller of the window
        var viewController = LoginVC(nibName: "LoginVC", bundle: nil)
        self.navigationController = UINavigationController(rootViewController: viewController)
        self.window!.rootViewController = self.navigationController
        
        var navigationBarAppearace = UINavigationBar.appearance()
        
        navigationBarAppearace.tintColor = UIColor.whiteColor()
        navigationBarAppearace.barTintColor =  UIColorFromRGB(0xACD8FF)
        
        // change navigation item title color
        navigationBarAppearace.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.whiteColor()]
        //navigationBarAppearace.titleTextAttributes = [NSFontAttributeName: UIFont(name: "MyriadPro-Regular.otf", size: 34)!]

        //change status bar
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent
    
        return true
    }


    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }



}

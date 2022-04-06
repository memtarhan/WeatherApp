//
//  AppDelegate.swift
//  WeatherApp
//
//  Created by Mehmet Tarhan on 06/04/2022.
//

import Swinject
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var assembler: Assembler?

    var rootViewController: UIViewController? {
        get { return window?.rootViewController }
        set {
            window?.rootViewController = newValue
            window?.makeKeyAndVisible()
        }
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        initWindow()
        initDI()
        initUI()
        return true
    }

    /// - Initializing window
    private func initWindow() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
    }

    /// - Initializing dependency injection
    private func initDI() {
        assembler = Assembler([
            /// - Screens
            BrowserAssembly(),
            WeatherAssembly(),

        ])
        assembler?.apply(assembly: ViewControllerFactoryAssembly(assembler: assembler!))
    }

    /// - Initializing UI w/ initial view controller
    func initUI() {
        rootViewController = tabBar
    }

    fileprivate var tabBar: UITabBarController {
        let tabBarController = UITabBarController()
        if let weather = assembler?.resolver.resolve(WeatherViewController.self) as? UIViewController,
           let browser = assembler?.resolver.resolve(BrowserViewController.self) as? UIViewController {
            weather.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
            browser.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "safari"), selectedImage: UIImage(systemName: "safari.fill"))

            tabBarController.setViewControllers([weather, browser], animated: true)
        }

        return tabBarController
    }
}

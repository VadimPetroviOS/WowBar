//
//  AppDelegate.swift
//  WowBar
//
//  Created by Вадим on 22.05.2023.
//

import UIKit


@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        // Устанавливаем цвет фона для таб-бара
        UITabBar.appearance().barTintColor = UIColor.black

        // Устанавливаем цвет текста для элементов таб-бара
        UITabBar.appearance().tintColor = UIColor.white

        // Устанавливаем цвет текста для невыбранных элементов таб-бара
        UITabBar.appearance().unselectedItemTintColor = UIColor.gray
        
        let defaults = UserDefaults.standard
        
        // Получаем текущую дату
        let currentDate = Date()
        
        // Получаем дату последнего доступа
        var lastAccessDate = defaults.object(forKey: "lastAccessDate") as? Date
        
        // Если последний доступ не был осуществлен, устанавливаем дату как текущую дату минус один день
        if lastAccessDate == nil {
            let calendar = Calendar.current
            lastAccessDate = calendar.date(byAdding: .day, value: -1, to: currentDate)
        }
        
        // Проверяем, прошел ли уже один день с момента последнего доступа
        let calendar = Calendar.current
        if let lastAccessDate = lastAccessDate,
           calendar.isDateInYesterday(lastAccessDate) {
            // Удаляем данные
            defaults.removeObject(forKey: "oneButton")
            defaults.removeObject(forKey: "twoButton")
            defaults.removeObject(forKey: "fourButton")
            defaults.removeObject(forKey: "sevenButton")
            defaults.removeObject(forKey: "tenButton")
            defaults.removeObject(forKey: "twelveButton")
            defaults.removeObject(forKey: "thirteenButton")
        }
        
        // Сохраняем текущую дату как дату последнего доступа
        defaults.set(currentDate, forKey: "lastAccessDate")
        
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


}


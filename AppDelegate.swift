import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // 请求发送通知的权限
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            if granted {
                print("通知权限已授权")
            } else if let error = error {
                print("通知权限错误: \(error)")
            }
        }
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        scheduleNotification()
    }

    func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = "休息提醒"
        content.body = "打开应用开始20秒眼睛休息"
        content.sound = UNNotificationSound.default

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: "eyeRestReminder", content: content, trigger: trigger)

        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("无法添加通知: \(error)")
            }
        }
    }
}


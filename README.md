# itechnika-example-notification-authorization-ios
At what point can we receive the FCM Registration ID on iOS?

#### When the app is launched immediately after installation and the user selects 'Allow' on the Notification Authorization Popup:  
1. application:didFinishLaunchingWithOptions:nil
2. onResume (UIApplication.willEnterForegroundNotification)
3. application:didRegisterForRemoteNotificationsWithDeviceToken:32 bytes
4. Registration ID:Optional("...."):nil
5. requestAuthorization:true:nil (After the user selects 'Allow')

#### When the app is launched again after being closed, and the user has already selected 'Allow' on the Notification Authorization Popup:  
1. application:didFinishLaunchingWithOptions:nil
2. requestAuthorization:true:nil
3. onResume (UIApplication.willEnterForegroundNotification)
4. application:didRegisterForRemoteNotificationsWithDeviceToken:32 bytes
5. Registration ID:Optional("...."):nil

#### When the app is launched immediately after installation and the user selects 'Don't Allow' on the Notification Authorization Popup:  
1. application:didFinishLaunchingWithOptions:nil
2. onResume (UIApplication.willEnterForegroundNotification)
3. application:didRegisterForRemoteNotificationsWithDeviceToken:32 bytes
4. Registration ID:Optional("...."):nil
5. requestAuthorization:false:nil (After the user selects 'Don't Allow')

#### When the app is launched again after being closed, and the user has already selected 'Don't Allow' on the Notification Authorization Popup:  
1. application:didFinishLaunchingWithOptions:nil
2. requestAuthorization:false:nil
3. onResume (UIApplication.willEnterForegroundNotification)
4. application:didRegisterForRemoteNotificationsWithDeviceToken:32 bytes
5. Registration ID:Optional("...."):nil


No APNS token specified before fetching FCM Token on iOS

```swift
func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
    print("application:didRegisterForRemoteNotificationsWithDeviceToken:\(deviceToken)")
    
    Messaging.messaging().apnsToken = deviceToken
    Messaging.messaging().token { token, error in
        print("Registration ID:\(String(describing: token)):\(String(describing: error))")
    }
}
```

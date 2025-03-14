//
//  ViewController.swift
//  itechnika-example-notification-authorization-ios
//
//  Created by fmthead on 3/14/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(onResume), name:
                UIApplication.willEnterForegroundNotification, object: nil)
    }

    @objc func onResume() {
        print("onResume")
    }

}


//
//  ViewController.swift
//  TempusFugit
//
//  Created by Jasmee Sengupta on 21/03/18.
//  Copyright © 2018 Jasmee Sengupta. All rights reserved.
// next: create a timer app
//separate this timeout sign out app

import UIKit

var count = 0
var testTimeOut = 10.0

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        AppTimer.startTimer(period: testTimeOut)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

class CustomWindow: UIWindow {
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        print("touched now \(count)")
        count += 1
        AppTimer.resetTimer()
        return false
    }
}

class AppTimer {
    //private static var timeout = 10//20 * 60 * 60
    //private static var timeRemaining = timeout
    private static var appTimer: Timer?
    
    static func startTimer(period: Double) {
        //appTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        appTimer = Timer.scheduledTimer(timeInterval: period, target: self, selector: #selector(endTimer), userInfo: nil, repeats: false)
    }
    
//    @objc private static func updateTimer() {
//        if timeRemaining > 0 {
//            timeRemaining -= 1
//        } else if timeRemaining == 0 {
//            endTimer()
//        }
//    }
    
    @objc private static func endTimer() {
        if let _ = appTimer {
            appTimer!.invalidate()
            print("20 minutes expired, you will be signed out")
            // SIGNOUT //notification?
        }
    }
    
    static func resetTimer() {
        //print("\(timeRemaining) of \(timeout)")
        if let _ = appTimer {
            appTimer!.invalidate()
        }
        //timeRemaining = timeout
        print("Timer reset")
        AppTimer.startTimer(period: testTimeOut)
    }
}


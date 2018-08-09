//
//  ViewController.swift
//  senitest
//
//  Created by Yoshiatsu Irei on 2018/08/02.
//  Copyright © 2018年 Yoshiatsu Irei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var timer : Timer?
    var count = 0
    let settingKey = "timer_value"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let settings = UserDefaults.standard
        settings.register(defaults: [settingKey:10])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 @IBOutlet weak var countDownLabel: UILabel!
    
    func interruptButton(){
        if let nowTimer = timer {
            if nowTimer.isValid == true {
                nowTimer.invalidate()
            }
        }
    }
    
    @IBAction func settingButtonAction(_ sender: Any) {
        interruptButton()
        performSegue(withIdentifier: "goSetting", sender: nil)
    }
    
    
    @IBAction func stopButtonAction(_ sender: Any) {
        interruptButton()
    }
    @IBAction func startButtonAction(_ sender: Any) {
        if let nowTimer = timer {
            if nowTimer.isValid == true {
                return
            }
        }
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.timerInterrupt(_:)), userInfo: nil, repeats: true)
    }
    
    func displayUpdate() -> Int {
        let settings = UserDefaults.standard
        let timerValue = settings.integer(forKey: settingKey)
        let remainCount = timerValue - count
        countDownLabel.text = "残り\(remainCount)秒"
        return remainCount
    }
    
    
    
    @objc func timerInterrupt(_ timer:Timer) {
        count += 1
        if displayUpdate() <= 0 {
            count = 0
            timer.invalidate()
            
            let alertController = UIAlertController(title: "終了", message: "タイマーが終了しました", preferredStyle: .actionSheet)
            let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            alertController.addAction(defaultAction)
            present(alertController,animated: true,completion: nil)
            
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        count = 0
        _ = displayUpdate()
    }
}


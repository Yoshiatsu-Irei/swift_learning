//
//  ViewController.swift
//  test2
//
//  Created by Yoshiatsu Irei on 2018/07/05.
//  Copyright © 2018年 Yoshiatsu Irei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func setDefaultLabelText(_ sender: UIButton) {
        mealNameLabel.text = "Default Text"
    }
        @IBOutlet weak var mealNameLabel: UILabel!
    //MARK:Propeties
    

    @IBOutlet weak var nemeTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    //MARK:Action
 
    
}


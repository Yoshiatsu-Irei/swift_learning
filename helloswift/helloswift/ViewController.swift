//
//  ViewController.swift
//  helloswift
//
//  Created by Yoshiatsu Irei on 2018/07/10.
//  Copyright © 2018年 Yoshiatsu Irei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    

    outputLabel.text = "Hello Swift!"
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var outputLabel: UILabel!
    
}


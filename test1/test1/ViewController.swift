//
//  ViewController.swift
//  test1
//
//  Created by Yoshiatsu Irei on 2018/06/28.
//  Copyright © 2018年 Yoshiatsu Irei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func onButtonTap(_ sender: Any) {
        myTextfield.text = "hello world!"
    }
    
    @IBOutlet weak var myTextfield: UITextField!
    
    @IBAction func tab1(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


//
//  ViewController.swift
//  camera
//
//  Created by Yoshiatsu Irei on 2018/08/02.
//  Copyright © 2018年 Yoshiatsu Irei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var pictureImage: UIImageView!
    
    @IBAction func cameraButtonAction(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            print("カメラは利用できます")
        }else{
             print("カメラは利用できません")
        }
    }
    
    @IBAction func SNSButtonAction(_ sender: Any) {
    }
}


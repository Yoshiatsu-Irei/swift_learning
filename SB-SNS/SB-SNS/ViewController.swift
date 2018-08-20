//
//  ViewController.swift
//  SB-SNS
//
//  Created by 伊禮吉充 on 2018/08/20.
//  Copyright © 2018年 伊禮吉充. All rights reserved.
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

    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func showActivityView(_ sender: UIBarButtonItem) {
        let controller = UIActivityViewController(activityItems: [imageView.image!], applicationActivities: nil)
       
        self.present(controller, animated: false, completion: {print("表示完了")})
    }
}


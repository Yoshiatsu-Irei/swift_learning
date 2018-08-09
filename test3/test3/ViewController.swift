//
//  ViewController.swift
//  test3
//
//  Created by Yoshiatsu Irei on 2018/07/14.
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

    @IBOutlet weak var answerImageView: UIImageView!
    
    @IBOutlet weak var answerLabel: UILabel!
    
    var ansewerNumber = 0
    
    @IBAction func shuffleAction(_ sender: Any) {
        
  //      ansewerNumber = Int(arc4random_uniform(3))
    
        var newAnswerNunber = 0
        
        repeat{
            newAnswerNunber = Int(arc4random_uniform(3))
        }while ansewerNumber == newAnswerNunber
        
        ansewerNumber = newAnswerNunber
        
        if ansewerNumber == 0{
        answerLabel.text = "グー"
        answerImageView.image = UIImage(named:"gu")
        }
        else if ansewerNumber == 1{
            answerLabel.text = "チョキ"
            answerImageView.image = UIImage(named:"choki")
        }
        else if ansewerNumber == 2{
            answerLabel.text = "パー"
            answerImageView.image = UIImage(named:"pa")
        }
        
    }
}


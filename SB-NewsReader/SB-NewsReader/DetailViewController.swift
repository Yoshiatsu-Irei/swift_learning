//
//  DetailViewController.swift
//  SB-NewsReader
//
//  Created by 伊禮吉充 on 2018/08/21.
//  Copyright © 2018年 伊禮吉充. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController : UIViewController {
    
    @IBOutlet weak var webView : WKWebView!
    
    var link : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = URL(string: self.link){
            let request = URLRequest(url: url)
            self.webView.load(request)
        }
    }
    
}

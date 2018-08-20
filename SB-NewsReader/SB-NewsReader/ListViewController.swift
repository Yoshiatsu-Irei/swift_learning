//
//  ListViewController.swift
//  SB-NewsReader
//
//  Created by 伊禮吉充 on 2018/08/20.
//  Copyright © 2018年 伊禮吉充. All rights reserved.
//

import UIKit

class ListViewController : UITableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section : Int) -> Int{
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        return cell
    }
    
}

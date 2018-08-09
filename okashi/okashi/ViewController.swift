//
//  ViewController.swift
//  okashi
//
//  Created by Yoshiatsu Irei on 2018/08/03.
//  Copyright © 2018年 Yoshiatsu Irei. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController , UISearchBarDelegate, UITableViewDataSource,UITableViewDelegate, SFSafariViewControllerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        searchText.delegate = self
        searchText.placeholder = "お菓子の名前を入力してください"
        tableView.dataSource = self
        tableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var searchText: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var okashiList : [(maker:String, name:String, link:URL, image:URL)] = []
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
        
        if let searchWord = searchBar.text{
            print(searchWord)
            searchOkashi(keyword: searchWord)
        }
    }
    
    struct ItemJson: Codable{
        let name : String?
        let maker : String?
        let url : URL?
        let image : URL?
    }
    
    struct ResultJson : Codable {
        let item:[ItemJson]?
    }
    
    // searchOkashi method
    func searchOkashi(keyword : String){
        guard let keyword_encode = keyword.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else{
            return
        }
        
        guard let req_url = URL(string:"http://www.sysbird.jp/toriko/api/?apikey=guest&format=json&keyword=\(keyword_encode)&max=10&order=r") else {
            return
        }
        print(req_url)
    
    
    let req = URLRequest(url:req_url)
    let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
    
    let task = session.dataTask(with: req, completionHandler: {
        (data, response, error) in
        session.finishTasksAndInvalidate()
        do{
            let decoder = JSONDecoder()
            let json = try decoder.decode(ResultJson.self, from:data!)
            //print(json)
            
            if let items = json.item{
                self.okashiList.removeAll()
                for item in items{
                    if let maker = item.maker, let name = item.name, let link = item.url,let image = item.image{
                        let okashi = (maker,name,link,image)
                        self.okashiList.append(okashi)
                    }
                }
                self.tableView.reloadData()
                if let okashidbg = self.okashiList.first{
                    print("--------------------")
                    print("okashiList[0] = \(okashidbg)")
                    }
                }

        }catch{
            print("エラーが出ました")
        }
        
        })
    task.resume()
    
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return okashiList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "okashiCell", for: indexPath)
        cell.textLabel?.text = okashiList[indexPath.row].name
        if let imageData = try? Data(contentsOf:okashiList[indexPath.row].image){
            cell.imageView?.image = UIImage(data: imageData)
            
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated:true)
        
        let safariViewController = SFSafariViewController(url: okashiList[indexPath.row].link)
        
        safariViewController.delegate = self
        
        present(safariViewController, animated: true, completion: nil)
    }
    
    func safariViewControllerDidFinish(_ controller: SFSafariViewController){
        dismiss(animated: true, completion: nil)
    }
}


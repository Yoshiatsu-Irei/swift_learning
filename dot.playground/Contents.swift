//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController ,UICollectionViewDelegate, UICollectionViewDataSource{
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white

        view.frame = CGRect(x:0,y:0,width:640,height:480)
        
        self.view = view
    }
    
    var myCollectionView : UICollectionView!
    let cellIdentifier = "myCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = UICollectionViewFlowLayout()
        
        layout.itemSize = CGSize(width: 20, height: 20)
        layout.minimumInteritemSpacing = 1.0
        layout.minimumLineSpacing = 1.0
        
            myCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        
        myCollectionView.register(UICollectionViewCell.self,forCellWithReuseIdentifier:cellIdentifier)
        
        view.addSubview(myCollectionView)
        
        myCollectionView.dataSource = self
        
        myCollectionView.delegate = self
        
    }
    
    func collectionView(_ collectionView:UICollectionView, numberOfItemsInSection section:Int) -> Int {
        return 690
    }
    
    func collectionView(_ collectionView:UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
        cell.backgroundColor = .orange
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath){
            cell.backgroundColor = (cell.backgroundColor == .black ? .orange : .black)
        }
    }
    
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()

//
//  EffectViewController.swift
//  camera
//
//  Created by 伊禮吉充 on 2018/08/07.
//  Copyright © 2018年 Yoshiatsu Irei. All rights reserved.
//

import UIKit

class EffectViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        effectImage.image = originalImage
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBOutlet weak var effectImage: UIImageView!
    let filterArray = ["CIPhotoEffectMono"]
    var filterSelectNumber = 0
    var originalImage : UIImage?
    
  /*  @IBAction func effectButtonAction(_ sender: Any) {
        if let image = originalImage{
            let filterName = "CIPhotoEffectMono"
            let rotate = image.imageOrientation
            let inputImage = CIImage(image: image)
            guard let effectFilter = CIFilter(name: filterName) else{
                return
            }
            effectFilter.setDefaults()
            
            effectFilter.setValue(inputImage, forKey: kCIInputImageKey)
            
            guard let outputImage = effectFilter.outputImage else {
                return
            }
            
            let ciContext = CIContext(options: nil)
            
            guard let cgImage = ciContext.createCGImage(outputImage, from: outputImage.extent) else{
                return
            }
            
            effectImage.image = UIImage(cgImage: cgImage, scale: 1.0, orientation: rotate)
        }
    }*/
    @IBAction func effectButtonAction(_ sender: Any) {
        // エフェクト前画像をアンラップしてエフェクト用画像として取り出す
        if let image = originalImage {
            // フィルター名を指定
            let filterName = filterArray[filterSelectNumber]
            
            // 次の選択するエフェクト添字に更新
            filterSelectNumber += 1
            
            // 添字が配列の数と同じか？チェック
            if filterSelectNumber == filterArray.count {
                // 同じ場合は最後まで選択されたので先頭に戻す
                filterSelectNumber = 0
            }
            
            // 元々の画像の回転角度を取得
            let rotate = image.imageOrientation
            
            // UIImage形式の画像をCIImage形式の画像に変換
            let inputImage = CIImage(image: image)
            
            // フィルターの種類を引数で指定された種類を指定してCIFilterのインスタンスを取得
            guard let effectFilter = CIFilter(name: filterName) else {
                return
            }
            
            // エフェクトのパラメータを初期化
            effectFilter.setDefaults()
            
            // インスタンスにエフェクトする元画像を設定
            effectFilter.setValue(inputImage, forKey: kCIInputImageKey)
            
            // エフェクト後のCIImage形式の画像を取り出す
            guard let outputImage = effectFilter.outputImage else {
                return
            }
            
            // CIContextのインスタンスを取得
            let ciContext = CIContext(options: nil)
            
            // エフェクト後の画像をCIContext上に描画し、結果をcgImageとしてCGImage形式の画像を取得
            guard let cgImage = ciContext.createCGImage(outputImage, from: outputImage.extent) else {
                return
            }
            
            // エフェクト後の画像をCGImage形式からUIImage形式に変更。その際に回転角度を指定。そして、ImageViewに表示
            effectImage.image = UIImage(cgImage: cgImage, scale: 1.0, orientation: rotate)
        }
    }
    
    
    @IBAction func shareButtonAction(_ sender: Any) {
    }
    
    @IBAction func closeButtonAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

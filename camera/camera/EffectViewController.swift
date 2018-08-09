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
    
    @IBAction func effectButtonAction(_ sender: Any) {
        
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
    }
 
    @IBAction func shareButtonAction(_ sender: Any) {
        
        if let shareImage = effectImage.image{
            
            let shareItems = [shareImage]
            
            
            let controller = UIActivityViewController(activityItems: shareItems, applicationActivities: nil)
            
            
            controller.popoverPresentationController?.sourceView = view
            
            
            present(controller, animated: true, completion: nil)
        }
    }
    
    @IBAction func closeButtonAction(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
}

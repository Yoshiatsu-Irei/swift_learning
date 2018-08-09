//
//  ViewController.swift
//  camera
//
//  Created by Yoshiatsu Irei on 2018/08/02.
//  Copyright © 2018年 Yoshiatsu Irei. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UINavigationControllerDelegate,UIImagePickerControllerDelegate{

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
        let alertController = UIAlertController(title: "confirmation", message: "please select below", preferredStyle: .actionSheet)
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            let cameraAction = UIAlertAction(title: "camera", style: .default, handler: {(action:UIAlertAction) in
                
                let imagePickerController : UIImagePickerController = UIImagePickerController()
                imagePickerController.sourceType = .camera
                imagePickerController.delegate = self
                self.present(imagePickerController, animated: true, completion: nil)
            })
            alertController.addAction(cameraAction)
        }
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            
        
            let photoLibraryAction = UIAlertAction(title: "photo library", style: .default, handler: {(action: UIAlertAction) in
                
                let imagePickerController : UIImagePickerController = UIImagePickerController()
                imagePickerController.sourceType = .photoLibrary
                imagePickerController.delegate = self
                self.present(imagePickerController, animated: true, completion: nil)
            })
            alertController.addAction(photoLibraryAction)
        }
        let cancelAction = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        alertController.popoverPresentationController?.sourceView = view
        
        present(alertController, animated: true, completion: nil)
        
    }
    
 /*   @IBAction func SNSButtonAction(_ sender: Any) {
        if let shareImage = pictureImage.image{
            let shareItems = [shareImage]
            let controller = UIActivityViewController(activityItems: shareItems, applicationActivities: nil)
            controller.popoverPresentationController?.sourceView = view
            
            present(controller, animated: true, completion: nil)
        }
    }*/
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        captureImage = info[UIImagePickerControllerOriginalImage] as? UIImage
        dismiss(animated: true, completion: {
            self.performSegue(withIdentifier: "showEffectView", sender: nil)
        })
    }
    
    var captureImage : UIImage?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if let nextViewController = segue.destination as? EffectViewController{
            nextViewController.originalImage = captureImage
        }
    }
}


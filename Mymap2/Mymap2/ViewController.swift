//
//  ViewController.swift
//  Mymap2
//
//  Created by Yoshiatsu Irei on 2018/07/16.
//  Copyright © 2018年 Yoshiatsu Irei. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController , UITextFieldDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        inputText.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var inputText: UITextField!
    @IBOutlet weak var dispMap: MKMapView!
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if let searchKey = textField.text{
            print(searchKey)
            
            let geocoder = CLGeocoder()
            
            geocoder.geocodeAddressString(searchKey, completionHandler: { (placemarks, error) in
                
            if let unwarpPlacemarks = placemarks{
                if let firstPlacemark = unwarpPlacemarks.first {
                    if let location = firstPlacemark.location {
                        let targetCoordinate = location.coordinate
                            
                        print(targetCoordinate)
                        
                        let pin = MKPointAnnotation()
                        pin.coordinate = targetCoordinate
                        pin.title = searchKey
                        self.dispMap.addAnnotation(pin)
                        self.dispMap.region = MKCoordinateRegionMakeWithDistance(targetCoordinate, 500.0, 500.0)
                        }
                    }
                }
            })
            
        }
        return true
    }
    
    @IBAction func changeMapButtonAction(_ sender: Any) {
        if dispMap.mapType == .standard{
            dispMap.mapType = .satellite
        }
        else if dispMap.mapType == .satellite{
            dispMap.mapType = .hybrid
        }
        else if dispMap.mapType == .hybrid{
            dispMap.mapType = .satelliteFlyover
        }
        else if dispMap.mapType == .satelliteFlyover{
            dispMap.mapType = .hybridFlyover
        }
        else{
            dispMap.mapType = .standard
        }
    }
}


//
//  ShapesViewController.swift
//  DrawPad
//
//  Created by Dalton on 12/10/17.
//  Copyright © 2017 Ray Wenderlich. All rights reserved.
//

import Foundation
import UIKit
import Mixpanel

protocol ShapesViewControllerDelegate: class {
    func shapesViewControllerFinished(_ shapesViewController: ShapesViewController)
}

class ShapesViewController: UIViewController {
    
    weak var delegate: ShapesViewControllerDelegate?
    var selectedShape:String = "Star"
    
    let deviceId = UIDevice.current.identifierForVendor?.uuidString
    
    let shapes: [String] = [
        "Circle",
        "Candy Cane",
        "Star",
        "Snow Flake",
        "Holly",
        "Tree",
        "Deer"
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Mixpanel.mainInstance().track(event: "shapesViewControllerViewed",
                                      properties: ["Device" : deviceId!])

    }
    
    @IBAction func shapeTapped(_ sender: AnyObject) {
        
        var index = sender.tag ?? 0
        if index < 0 || index > shapes.count {
            index = 0
        }
        
        selectedShape = shapes[index]
        close()
    }
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        close()
    }
    
    func close() {
        dismiss(animated: true, completion: nil)
        self.delegate?.shapesViewControllerFinished(self)
    }
}

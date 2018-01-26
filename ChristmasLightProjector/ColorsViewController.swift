//
//  ColorsViewController.swift
//  DrawPad
//
//  Created by Dalton on 12/7/17.
//  Copyright © 2017 Ray Wenderlich. All rights reserved.
//

import Foundation
import UIKit
import Mixpanel

protocol ColorsViewControllerDelegate: class {
    func colorsViewControllerFinished(_ colorsViewController: ColorsViewController)
}

class ColorsViewController: UIViewController {
    

    weak var delegate: ColorsViewControllerDelegate?
    var isRandomColor = false
    
    let deviceId = UIDevice.current.identifierForVendor?.uuidString

    var selectedColor:(CGFloat, CGFloat, CGFloat) = (0.0, 0.0, 0.0)
    var selectedIndex = 0
    
    let colors: [(CGFloat, CGFloat, CGFloat)] = [
        (234.0/255.0, 13.0/255.0, 43.0/255.0),
        (34.0/255.0, 84.0/255.0, 251.0/255.0),
        (60.0/255.0, 218.0/255.0, 34.0/255.0),
        (242.0/255.0, 175.0/255.0, 35.0/255.0),
        (255.0/255.0, 254.0/255.0, 208.0/255.0),
        (1.0, 1.0, 1.0),
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Mixpanel.mainInstance().track(event: "colorsViewControllerViewed",
                                      properties: ["Device" : deviceId!])

    }

    @IBAction func colorPressed(_ sender: AnyObject) {
        var index = sender.tag ?? 0
        if index < 0 || index > colors.count {
            index = 0
            selectedIndex = 0
        }
        
        if index == 5 {
            isRandomColor = true
            selectedIndex = 5
        }
        
        selectedColor = colors[index]
        selectedIndex = index
        close()
    }
    @IBAction func closeButtonTapped(_ sender: Any) {
        close()
    }
    
    func close() {
        dismiss(animated: true, completion: nil)
        self.delegate?.colorsViewControllerFinished(self)
    }

}

//
//  WaitingViewController.swift
//  DrawPad
//
//  Created by Dalton on 12/22/17.
//  Copyright © 2017 Ray Wenderlich. All rights reserved.
//

import UIKit


class WaitingViewController: UIViewController {
    
    let kShowMainVCSegueId = "showMainVC"
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var mainImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        toggleFinished(finished: false)
        let when = DispatchTime.now() + 5 // change to desired number of seconds
        DispatchQueue.main.asyncAfter(deadline: when) {
            // Your code with delay
            self.toggleFinished(finished: true)
        }
    }
    
    func toggleFinished(finished: Bool) {
        textLabel.text = finished ? "Finished!\nEnjoy your lights." : "Putting up your lights... \nAren't you glad you don't have to do this yourself?"
        
        doneButton.isHidden = !finished
        mainImageView.isHidden = finished
        spinner.isHidden = finished
    }
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        self.performSegue(withIdentifier: self.kShowMainVCSegueId, sender: self)
    }
    
}

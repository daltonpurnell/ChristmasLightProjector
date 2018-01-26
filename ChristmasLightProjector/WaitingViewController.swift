//
//  WaitingViewController.swift
//  DrawPad
//
//  Created by Dalton on 12/22/17.
//  Copyright © 2017 Ray Wenderlich. All rights reserved.
//

import UIKit
import Mixpanel


class WaitingViewController: UIViewController {
    
    
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
        Mixpanel.mainInstance().track(event: "waitingVCDoneButtonTapped")

        dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let mainVC = segue.destination as! ViewController
        mainVC.isConnected = true
    }
    
}

//
//  StepZero.swift
//  ChristmasLightProjector
//
//  Created by Dalton on 1/23/18.
//  Copyright © 2018 Dalton Purnell. All rights reserved.
//

import UIKit

class StepZero : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UserDefaults.standard.set(true, forKey: "onboarding")
        UserDefaults.standard.synchronize()
    }
    
    @IBAction func skippTapped(_ sender: Any) {
        print("SKIP")
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() {
            navigationController?.pushViewController(vc, animated: true)
//            present(vc, animated: true, completion: nil)
        }
    }
    
}

//
//  StepTwo.swift
//  ChristmasLightProjector
//
//  Created by Dalton on 1/23/18.
//  Copyright © 2018 Dalton Purnell. All rights reserved.
//

import UIKit

class StepTwo : UIViewController {
    
    @IBAction func doneTapped(_ sender: Any) {
        print("DONE")
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() {
            navigationController?.pushViewController(vc, animated: true)
//            present(vc, animated: true, completion: nil)
        }
    }
}

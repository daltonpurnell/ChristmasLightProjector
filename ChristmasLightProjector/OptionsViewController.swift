//
//  OptionsViewController.swift
//  ChristmasLightProjector
//
//  Created by Dalton on 1/11/18.
//  Copyright © 2018 Dalton Purnell. All rights reserved.
//

import Foundation
import UIKit

protocol OptionsViewControllerDelegate: class {
    func optionsViewControllerFinished(_ optionsViewController: OptionsViewController)
}

class OptionsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    weak var delegate: OptionsViewControllerDelegate?
    
    @IBOutlet weak var tableView: UITableView!
    
    var isConnected = false
    var options:[String] = []
    var disconnectSelected = false
    var connectSelected = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        let connectTitle = isConnected ? "Disconnect from Device" : "Connect to Device"
        options = [connectTitle, "Send Feedback"]
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! UITableViewCell
        cell.textLabel?.text = options[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            if isConnected {
                disconnectSelected = true
                connectSelected = false
            } else {
                connectSelected = true
                disconnectSelected = false
            }
            dismiss(animated: true, completion: nil)
            self.delegate?.optionsViewControllerFinished(self)

        } else if indexPath.row == 1 {
            // launch feedback form
        }
    }
    
    @IBAction func cancelTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    
    
}

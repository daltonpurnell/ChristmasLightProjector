//
//  OptionsViewController.swift
//  ChristmasLightProjector
//
//  Created by Dalton on 1/11/18.
//  Copyright © 2018 Dalton Purnell. All rights reserved.
//

import Foundation
import UIKit
import MessageUI
import Mixpanel

protocol OptionsViewControllerDelegate: class {
    func optionsViewControllerFinished(_ optionsViewController: OptionsViewController)
}

class OptionsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MFMailComposeViewControllerDelegate {
    
    weak var delegate: OptionsViewControllerDelegate?
    
    @IBOutlet weak var tableView: UITableView!
    
    var isConnected = false
    var isOn = true
    var options:[String] = []
    var icons: [String] = []
    
    var disconnectSelected = false
    var connectSelected = false
    var turnOnSelected = false
    var turnOffSelected = false
    var connectedDeviceName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Mixpanel.mainInstance().track(event: "optionsViewControllerViewed")

        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        
        view.backgroundColor = .black
        let imageView: UIImageView = UIImageView.init(frame: CGRect(x: view.frame.origin.x, y: view.frame.origin.y, width: view.frame.size.width, height: view.frame.size.height))
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "night-sky")
        imageView.alpha = 0.6
        
        view.addSubview(imageView)
        view.sendSubview(toBack: imageView)
        
        let connectTitle = isConnected ? "Disconnect from \(connectedDeviceName)" : "Connect to Device"
        let onOffTitle = isOn ? "Turn Lights Off" : "Turn Lights On"
        let onOffSwitchImage = isOn ? "switch-on" : "switch-off"
        options = [onOffTitle, connectTitle, "Send Feedback"]
        icons = [onOffSwitchImage, "bluetooth", "feedback"]
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! UITableViewCell
        cell.backgroundColor = .clear
        cell.textLabel?.text = options[indexPath.row]
        cell.imageView?.image = UIImage(named:(icons[indexPath.row]))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            if isOn {
                turnOffSelected = true
                turnOnSelected = false
            } else {
                turnOnSelected = true
                turnOffSelected = false
            }
            dismiss(animated: true, completion: nil)
            self.delegate?.optionsViewControllerFinished(self)
            
        } else if indexPath.row == 1 {
            if isConnected {
                disconnectSelected = true
                connectSelected = false
            } else {
                connectSelected = true
                disconnectSelected = false
            }
            dismiss(animated: true, completion: nil)
            self.delegate?.optionsViewControllerFinished(self)

        } else if indexPath.row == 2 {
            // launch feedback form
            launchFeedBackEmailController()
        }
    }
    
    @IBAction func cancelTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func launchFeedBackEmailController() {
        let mailComposeViewController = configuredMailComposeViewController()
        if MFMailComposeViewController.canSendMail() {
            present(mailComposeViewController, animated: true, completion: nil)
        } else {
            showSendMailErrorAlert()
        }
    }
    
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self // Extremely important to set the --mailComposeDelegate-- property, NOT the --delegate-- property
        mailComposerVC.setToRecipients(["dalton.purnell61@gmail.com"])
        mailComposerVC.setSubject("Smart Lights Feedback")
        return mailComposerVC
    }
    
    func showSendMailErrorAlert() {

        let alert:UIAlertController = UIAlertController(title: "Could Not Send Email", message: "Your device could not send e-mail.  Please check e-mail configuration and try again.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: MFMailComposeViewControllerDelegate Method
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
}

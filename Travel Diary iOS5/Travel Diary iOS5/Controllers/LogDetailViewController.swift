//
//  LogDetailViewController.swift
//  Travel Diary iOS5
//
//  Created by Milo Kvarfordt on 6/1/23.
//

import UIKit

class LogDetailViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var logDateLabel: UILabel!
    @IBOutlet weak var logTitleTextField: UITextField!
    @IBOutlet weak var logAddressTextField: UITextField!
    @IBOutlet weak var logBodyTextView: UITextView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    // MARK: - Properties
    var log: Log?
    
    // MARK: - ACtions
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let title = logTitleTextField.text, !title.isEmpty,
              let address = logAddressTextField.text, !address.isEmpty,
              let body = logBodyTextView.text, !body.isEmpty else { return }
        
        if let log = log {
          //this means that log on line 26 has a value, which must mean user selected a cell and sent a log through the segue
            LogController.sharedInstance.updateLog(log: log, title: title, address: address, body: body)
        } else {
          // this means that log on line 26 does NOT have a value, which means user selected the plus button and is creating a new log
            LogController.sharedInstance.createLog(title: title, address: address, body: body)
        }
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Functions
    func updateUI() {
        logDateLabel.text = Date().asString()
        guard let log = log else { return }
        logDateLabel.text = log.logDate.asString()
        logTitleTextField.text = log.logTitle
        logAddressTextField.text = log.logAddress
        logBodyTextView.text = log.logBody
    }
    
}

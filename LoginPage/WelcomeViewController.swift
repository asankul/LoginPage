//
//  WelcomeViewController.swift
//  LoginPage
//
//  Created by Асанкул Садыков on 3/7/22.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet var welcomeLabel: UILabel!
    
    var username: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcomeLabel.text = "Welcome, \(username ?? "")!"
    }
}

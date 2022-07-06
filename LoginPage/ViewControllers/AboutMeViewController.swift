//
//  AboutMeViewController.swift
//  LoginPage
//
//  Created by Асанкул Садыков on 6/7/22.
//

import UIKit

class AboutMeViewController: UIViewController {
    
        
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var countryLabel: UILabel!
    @IBOutlet var jobLabel: UILabel!
    @IBOutlet var phoneLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    var usersName: String!
    var usersCountry: String!
    var usersJob: String!
    var usersPhone: String!
    var usersDescription: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = usersName
        countryLabel.text = usersCountry
        jobLabel.text = usersJob
        phoneLabel.text = usersPhone
        descriptionLabel.text = usersDescription

    }
}

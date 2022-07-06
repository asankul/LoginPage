//
//  AgeViewController.swift
//  LoginPage
//
//  Created by Асанкул Садыков on 6/7/22.
//

import UIKit

class DescriptionViewController: UIViewController {
    
    @IBOutlet var descriptionLabel: UILabel!
    
    var userDescription: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        descriptionLabel.text = userDescription

    }
}

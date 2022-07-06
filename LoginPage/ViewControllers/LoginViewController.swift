//
//  ViewController.swift
//  LoginPage
//
//  Created by Асанкул Садыков on 3/7/22.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var usernameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    private let persons = User.getPersons()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTF.isSecureTextEntry = true
        setupKeyboardHiding()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarVC = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBarVC.viewControllers else { return }
        
        viewControllers.forEach { viewController in
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.username = persons.filter{$0.username == usernameTF.text}[0].persons[0].name
            } else if let aboutMeVC = viewController as? AboutMeViewController {
                aboutMeVC.usersName = persons.filter{$0.username == usernameTF.text}[0].persons[0].name
                aboutMeVC.usersJob = persons.filter{$0.username == usernameTF.text}[0].persons[0].job
                aboutMeVC.usersPhone = persons.filter{$0.username == usernameTF.text}[0].persons[0].phone
                aboutMeVC.usersCountry = persons.filter{$0.username == usernameTF.text}[0].persons[0].country
                aboutMeVC.usersDescription = persons.filter{$0.username == usernameTF.text}[0].persons[0].description
            } else if let navigationVC = viewController as? UINavigationController {
                guard let myDescriptionVC = navigationVC.topViewController as? DescriptionViewController else { return }
                myDescriptionVC.userDescription = persons.filter{$0.username == usernameTF.text}[0].persons[0].description
            }
        }
    }
    
    @IBAction func loginButtonPressed() {
        if persons.filter({$0.username == usernameTF.text}).isEmpty ||
            persons.filter({$0.password == passwordTF.text}).isEmpty {
            showAlert(
                with: "Invalid login or password",
                and: "Please enter correct login or password",
                textField: passwordTF
            )
        }
    }
    
    @IBAction func forgotButtonPressed() {
        showAlert(with: "Oops!", and: "Check the modal form 😝")
    }

    @IBAction func unwind(for segue: UIStoryboardSegue) {
        usernameTF.text = ""
        passwordTF.text = ""
    }
    
    private func setupKeyboardHiding() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    
}

// MARK: - UIAlertController
extension LoginViewController {
    private func showAlert(with title: String, and message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) {_ in
            textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }
        view.frame.origin.y = 0 - keyboardSize.height / 2
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        view.frame.origin.y = 0
    }
}

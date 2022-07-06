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
    
    private let username = "User"
    private let password = "Password"
    
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
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.username = usernameTF.text
    }
    
    @IBAction func loginButtonPressed() {
        if usernameTF.text != username || passwordTF.text != password {
            showAlert(
                with: "Invalid login or password",
                and: "Please enter correct login or password",
                textField: passwordTF
            )
        }
    }
    
    @IBAction func forgotUserNamePressed() {
        showAlert(with: "Oops!", and: "Your user name is \(username) 😝")
    }
    
    @IBAction func forgotPasswordPressed() {
        showAlert(with: "Oops!", and: "Your password is \(password) 😝")
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

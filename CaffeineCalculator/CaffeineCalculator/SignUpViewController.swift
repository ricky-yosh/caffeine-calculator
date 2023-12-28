//
//  SignUpViewController.swift
//  CaffeineCalculator
//
//  Created by Ricky Yoshioka on 11/23/23.
//

import UIKit
import CoreData

class SignUpViewController: UIViewController {

    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtPasswordConfirmation: UITextField!
    @IBOutlet weak var lblMessageOutput: UILabel!
    
    let successMessage : String = "Success! Account created."
    let emptyFieldsMessage : String = "All fields must be filled!"
    let passwordMismatch : String = "Passwords must match!"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblMessageOutput.isHidden = true
        txtPassword.isSecureTextEntry = true
        txtPasswordConfirmation.isSecureTextEntry = true
    }
    
    @IBAction func btnSignUp(_ sender: UIButton)
    {
        lblMessageOutput.isHidden = false
        
        if (txtUsername.text != "" &&
            txtPassword.text != "" &&
            txtPasswordConfirmation.text != "")
        {
            if (txtPassword.text == txtPasswordConfirmation.text)
            {
                addNewAccount(newAccountUsername: txtUsername.text!, newAccountPassword: txtPassword.text!)
                lblMessageOutput.text = successMessage
            }
            else
            {
                lblMessageOutput.text = passwordMismatch
            }
        }
        else
        {
            lblMessageOutput.text = emptyFieldsMessage
        }
    }
    
    
    func addNewAccount(newAccountUsername : String, newAccountPassword : String)
    {
        let newAccount = Accounts(context: context)
        newAccount.username = newAccountUsername
        newAccount.password = newAccountPassword
        
        // save to CoreData
        appDelegate.saveContext()
    }

    
    @IBAction func showPassword(_ sender: UIButton)
    {
        txtPassword.isSecureTextEntry = !txtPassword.isSecureTextEntry
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        self.view.endEditing(true)
    }
}

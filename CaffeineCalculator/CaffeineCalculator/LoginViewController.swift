//
//  LoginViewController.swift
//  CaffeineCalculator
//
//  Created by Ricky Yoshioka on 11/23/23.
//

import UIKit
import CoreData // get access to the "database"

// global vars
let appDelegate = UIApplication.shared.delegate as! AppDelegate
let context = appDelegate.persistentContainer.viewContext

var activeUser : String? // keep track of who is currently logged in

func listUsers()
{
    // create an array of username & passwords
    var data = [Accounts]()

    do
    {
        data = try context.fetch(Accounts.fetchRequest())

        print("Accounts:\n-----------")
        for existingAccount in data
        {
            print("Username: \(existingAccount.username!)")
            print("Password: \(existingAccount.password!)")
        }
    }
    catch{}
}
func listDrinkEntries()
{
    // create an array of username & passwords
    var data = [DrinkEntry]()

    do
    {
        data = try context.fetch(DrinkEntry.fetchRequest())

        print("\nDrink Entries:\n-----------")
        for drinkEntry in data
        {
            print("Username: \(drinkEntry.username!)")
            print("Image: \(drinkEntry.image!)")
            print("Address: \(drinkEntry.address!)")
            print("Date: \(String(describing: drinkEntry.date))")
            print("Drink Name: \(drinkEntry.drinkName!)")
            print("Drink Category: \(drinkEntry.drinkCategory!)")
            print("Drink Size: \(drinkEntry.drinkSize ?? "Error")")
        }
    }
    catch{}
}

class LoginViewController: UIViewController {
    
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var lblError: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblError.isHidden = true
        txtPassword.isSecureTextEntry = true
        
        listUsers()
        listDrinkEntries()
    }
    
    @IBAction func btnLogin(_ sender: UIButton)
    {
        // list accounts
        var data = [Accounts]()
        
        // pulling data from the database
        do
        {
            // fetch data
            data = try context.fetch(Accounts.fetchRequest())
            
            // go through each account
            for existingAccount in data
            {
                // check if username and password exist and match
                if(existingAccount.username! == txtUsername.text && existingAccount.password! == txtPassword.text)
                {
                    // set the current user
                    activeUser = txtUsername.text
                    
                    // change the storyboard to the next screen once they login
                    let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
                    let vc : UIViewController = mainStoryboard.instantiateViewController(withIdentifier: "TBCView") as UIViewController
                    self.present(vc, animated: true, completion: nil)
                    
                    return
                }
            }
            lblError.isHidden = false
        }
        catch{}
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

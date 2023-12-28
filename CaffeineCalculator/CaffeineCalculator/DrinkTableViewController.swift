//
//  DrinkTableViewController.swift
//  CaffeineCalculator
//
//  Created by Ricky Yoshioka on 11/28/23.
//

import UIKit

class DrinkTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate
{
    weak var delegate: PopoverViewControllerDelegate?

    @IBOutlet weak var txtDrinkField: UITextField!
    @IBOutlet weak var tblDrinksList: UITableView!
    
    var drinks = [StarbucksDrink]()
    var filteredDrinks = [StarbucksDrink]()
    var filtered = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        tblDrinksList.delegate = self
        tblDrinksList.dataSource = self
        txtDrinkField.delegate = self
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if let text = textField.text
        {
            filterText(text + string)
        }
        return true
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if txtDrinkField.text == ""
        {
            filteredDrinks = drinks
            tblDrinksList.reloadData()
        }
        tblDrinksList.reloadData()
    }
    
    func filterText(_ query: String)
    {
        filteredDrinks.removeAll()
        for drink in drinks
        {
            if drink.name.lowercased().contains(query.lowercased())
            {
                filteredDrinks.append(drink)
            }
        }
        tblDrinksList.reloadData()
        filtered = true
    }
    
    private func setupData()
    {
        for drink in starbucksMenuItems
        {
            drinks.append(drink)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if !filteredDrinks.isEmpty
        {
            return filteredDrinks.count
        }
        return filtered ? 0 : drinks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        cell.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0)
        
        var content = cell.defaultContentConfiguration()
        
        if !filteredDrinks.isEmpty
        {
            content.text = filteredDrinks[indexPath.row].name
            content.secondaryText = filteredDrinks[indexPath.row].category
        }
        else
        {
            content.text = drinks[indexPath.row].name
            content.secondaryText = drinks[indexPath.row].category
        }
        
        content.textProperties.color = .white
        content.secondaryTextProperties.color = .white

        cell.contentConfiguration = content
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        // Get the selected cell text
        var selectedText : StarbucksDrink? = nil
        if !filteredDrinks.isEmpty
        {
            selectedText = filteredDrinks[indexPath.row]
        }
        else
        {
            selectedText = drinks[indexPath.row]
        }
        
        newEntryViewControllerFields.drink = selectedText
        
        dismiss(animated: true, completion: delegate?.drinkTablePopoverWasDismissed)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        self.view.endEditing(true)
    }
}

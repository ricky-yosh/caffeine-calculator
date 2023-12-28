//
//  EntriesTableViewController.swift
//  CaffeineCalculator
//
//  Created by Ricky Yoshioka on 11/23/23.
//

import UIKit
import MapKit

var selectedDrinkIndex : Int = -1
var drinkEntries : [DrinkEntrySnapshot] = []

struct DrinkEntrySnapshot
{
    var drinkName: String
    var date: Date
    var drinkCategory: String
}

func formatDate(date: Date) -> String
{
    let formatter = DateFormatter()
    formatter.dateFormat = "MMMM dd yyyy"
    return formatter.string(from: date)
}

func formatTime(date: Date) -> String
{
    let formatter = DateFormatter()
    formatter.dateFormat = "h:mm a"
    return formatter.string(from: date)
}

class EntriesTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate
{
    @IBOutlet weak var txtEntriesSearch: UITextField!
    var entries = [DrinkEntrySnapshot]()
    var filteredEntries = [DrinkEntrySnapshot]()
    var filtered = false
    
    // Search functionality
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        if let text = textField.text
        {
            filterText(text + string)
        }
        return true
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField)
    {
        if txtEntriesSearch.text == ""
        {
            filteredEntries = entries
            tblDrinkEntries.reloadData()
        }
        tblDrinkEntries.reloadData()
    }
    
    func filterText(_ query: String)
    {
        filteredEntries.removeAll()
        for entry in entries
        {
            if entry.drinkName.lowercased().contains(query.lowercased())
            {
                filteredEntries.append(entry)
            }
        }
        tblDrinkEntries.reloadData()
        filtered = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if !filteredEntries.isEmpty
        {
            return filteredEntries.count
        }
        return entries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
        cell.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0)
        
        var content = cell.defaultContentConfiguration()
        
        content.text = "\(entries[indexPath.row].drinkName)"
        content.textProperties.color = .white
        content.secondaryText = "\(formatDate(date: entries[indexPath.row].date)) \(formatTime(date: entries[indexPath.row].date))"
        content.secondaryTextProperties.color = .white
        
        cell.contentConfiguration = content
        
        return cell
    }
    
    // TODO: Issue with this
    // function for editing style
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
    {
        // if editing style is delete
        if editingStyle == UITableViewCell.EditingStyle.delete
        {
            var data = [DrinkEntry]()
            
            do
            {
                data = try context.fetch(DrinkEntry.fetchRequest())
                
                for existingDrink in data
                {
                    if existingDrink.drinkName == entries[indexPath.row].drinkName &&
                        existingDrink.date! == entries[indexPath.row].date
                    {
                        context.delete(existingDrink)
                    }
                }
            }
            catch{}
            
            entries.remove(at: indexPath.row)
            drinkEntries = entries
            
            appDelegate.saveContext()
            tblDrinkEntries.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        selectedDrinkIndex = indexPath.row
        performSegue(withIdentifier: "ShowDetailsSegue", sender: selectedDrinkIndex)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "ShowDetailsSegue"
        {
            if let destinationVC = segue.destination as? EntryInformationViewController
            {
                if let selectedIndexPath = tblDrinkEntries.indexPathForSelectedRow
                {
                    destinationVC.selectedDrinkIndex = selectedIndexPath.row
                }
            }
        }
    }
    
    @IBOutlet weak var tblDrinkEntries: UITableView!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        tblDrinkEntries.delegate = self
        tblDrinkEntries.dataSource = self
        txtEntriesSearch.delegate = self
        entries = drinkEntries
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        drinkEntries = []
        
        var data = [DrinkEntry]()
        
        do
        {
            data = try context.fetch(DrinkEntry.fetchRequest())
            
            for existingDrink in data
            {
                if existingDrink.username == activeUser
                {
                    let drinkEntry = DrinkEntrySnapshot(drinkName: existingDrink.drinkName!,
                                                        date: existingDrink.date!,
                                                        drinkCategory: existingDrink.drinkCategory!)
                    drinkEntries.append(drinkEntry)
                }
            }
        }
        catch{}
        
        drinkEntries.sort { $0.date > $1.date }
        entries = drinkEntries
        tblDrinkEntries.reloadData()
    }
    
    @IBAction func btnAddDrinkEntry(_ sender: UIButton)
    {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)

        // Assuming the Storyboard ID of the Tab Bar Controller is "TabBarControllerID"
        if let tabBarController = mainStoryboard.instantiateViewController(withIdentifier: "TBCView") as? UITabBarController {
            // Set the desired index
            tabBarController.selectedIndex = 1
            
            // Present the entire tab bar controller
            self.present(tabBarController, animated: true, completion: nil)
        }
    }
    
}

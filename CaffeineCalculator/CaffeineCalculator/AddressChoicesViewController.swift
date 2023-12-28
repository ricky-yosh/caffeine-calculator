//
//  AddressChoicesViewController.swift
//  CaffeineCalculator
//
//  Created by Ricky Yoshioka on 11/30/23.
//

import UIKit
import MapKit

func parseAddress(selectedItem:MKPlacemark) -> String
{
    // put a space between "4" and "Melrose Place"
    let firstSpace = (selectedItem.subThoroughfare != nil && selectedItem.thoroughfare != nil) ? " " : ""
    // put a comma between street and city/state
    let comma = (selectedItem.subThoroughfare != nil || selectedItem.thoroughfare != nil) && (selectedItem.subAdministrativeArea != nil || selectedItem.administrativeArea != nil) ? ", " : ""
    // put a space between "Washington" and "DC"
    let secondSpace = (selectedItem.subAdministrativeArea != nil && selectedItem.administrativeArea != nil) ? " " : ""
    let addressLine = String(
        format:"%@%@%@%@%@%@%@",
        // street number
        selectedItem.subThoroughfare ?? "",
        firstSpace,
        // street name
        selectedItem.thoroughfare ?? "",
        comma,
        // city
        selectedItem.locality ?? "",
        secondSpace,
        // state
        selectedItem.administrativeArea ?? ""
    )
    return addressLine
}

class AddressChoicesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate
{
    weak var delegate: PopoverViewControllerDelegate?
    
    @IBOutlet weak var txtAddressField: UITextField!
    @IBOutlet weak var tblAddressList: UITableView!
    
    var data = [MKMapItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblAddressList.delegate = self
        tblAddressList.dataSource = self
        txtAddressField.delegate = self
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        if let text = textField.text
        {
            filterText(text + string)
        }
        return true
    }
    
    func filterText(_ query: String)
    {
        data.removeAll()
        updateSearchResults(inputLocation: query)
        tblAddressList.reloadData()
    }
    
    func updateSearchResults(inputLocation: String) {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = inputLocation
        let search = MKLocalSearch(request: request)
        search.start { response, _ in
            guard let response = response else {
                return
            }
            for item in response.mapItems
            {
                self.data.append(item)
            }
            
            self.tblAddressList.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        cell.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.0)
        var content = cell.defaultContentConfiguration()
        
        content.text = "\(String(describing: data[indexPath.row].name!))"
        content.textProperties.color = .white
        
        content.secondaryText = "\(parseAddress(selectedItem: data[indexPath.row].placemark))"
        content.secondaryTextProperties.color = .white
        
        cell.contentConfiguration = content
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        // Get the selected cell text
        var selectedText : MKMapItem? = nil
        selectedText = data[indexPath.row]
        
        newEntryViewControllerFields.address = selectedText
        
        dismiss(animated: true) {
            self.delegate?.addressTablePopoverWasDismissed()
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        self.view.endEditing(true)
    }
}

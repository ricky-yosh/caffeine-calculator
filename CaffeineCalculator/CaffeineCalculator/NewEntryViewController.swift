//
//  NewEntryViewController.swift
//  CaffeineCalculator
//
//  Created by Ricky Yoshioka on 11/23/23.
//

import UIKit
import MapKit

var newEntryViewControllerFields : DrinkData = DrinkData()
let recommendedFDADailyMaxOfCaffeiene : Float = 400.0 // "For healthy adults, the FDA has cited 400 milligrams a day"
// source: https://www.fda.gov/consumers/consumer-updates/spilling-beans-how-much-caffeine-too-much#:~:text=For%20healthy%20adults%2C%20the%20FDA,it%20(break%20it%20down).

protocol PopoverViewControllerDelegate: AnyObject
{
    func drinkTablePopoverWasDismissed()
    func addressTablePopoverWasDismissed()
}

class NewEntryViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    
    // Inputs
    @IBOutlet weak var txtAddressInput: UITextField!
    @IBOutlet weak var btnClearAddress: UIButton!
    @IBOutlet weak var txtDateInput: UITextField!
    @IBOutlet weak var txtDrinkNameInput: UITextField!
    @IBOutlet weak var btnClearDrinkName: UIButton!
    @IBOutlet weak var txtDrinkSizeInput: UITextField!
    
    
    var drinkSizes : [StarbucksSize] = []
    let drinkSizePickerView = UIPickerView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblAddressError.isHidden = true
        lblDateError.isHidden = true
        lblDrinkError.isHidden = true
        lblSizeError.isHidden = true
        
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .dateAndTime
        datePicker.addTarget(self, action: #selector(dateChange(datePicker:)), for: UIControl.Event.valueChanged)
        datePicker.frame.size = CGSize(width: 0, height: 300)
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.maximumDate = Date()
        
        txtDateInput.inputView = datePicker
        newEntryViewControllerFields.date = Date()
        txtDateInput.text = formatDate(date: Date()) // todays Date
        
        drinkSizePickerView.delegate = self
        drinkSizePickerView.dataSource = self
        txtDrinkSizeInput.inputView = drinkSizePickerView
        
        let address = newEntryViewControllerFields.address
        let addressIsValid : Bool = address != nil
        if addressIsValid
        {
            txtAddressInput.text = address!.name
            btnClearAddress.isHidden = false
        }
        else
        {
            resetAddressInput()
        }
        
        let drink = newEntryViewControllerFields.drink
        let drinkChoiceIsValid : Bool = drink != nil
        if drinkChoiceIsValid
        {
            txtDrinkNameInput.text = drink?.name
            btnClearDrinkName.isHidden = false
            txtDrinkSizeInput.isHidden = false
        }
        else
        {
            resetDrinkNameInput()
        }
        
        // Sets default image as image
        newEntryViewControllerFields.image = imgPicture.image
        if drinkSizes.isEmpty && !txtDrinkSizeInput.isHidden
        {
            makeDrinkSizesAvailable()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let destinationVC = segue.destination as? DrinkTableViewController
        {
            //4. setup the delegation
            //(say that I (mainViewController) will be the helper of destinationVC)
            destinationVC.delegate = self
        }
        
        if let destinationVC = segue.destination as? AddressChoicesViewController
        {
            //4. setup the delegation
            //(say that I (mainViewController) will be the helper of destinationVC)
            destinationVC.delegate = self
        }
    }
    
    func resetAddressInput()
    {
        newEntryViewControllerFields.address = nil
        txtAddressInput.text = ""
        btnClearAddress.isHidden = true
    }
    
    @IBAction func resetAddress(_ sender: UIButton)
    {
        resetAddressInput()
    }

    func resetDrinkNameInput()
    {
        txtDrinkNameInput.text = ""
        newEntryViewControllerFields.drink = nil
        newEntryViewControllerFields.drinkSize = nil
        btnClearDrinkName.isHidden = true
        txtDrinkSizeInput.text = ""
        txtDrinkSizeInput.isHidden = true
        drinkSizes = []
        calculateCaffeineDailyPercent()
    }
    
    @IBAction func btnClearDrinkName(_ sender: UIButton)
    {
        resetDrinkNameInput()
    }
    
    func updateDrinkName()
    {
        lblDrinkError.isHidden = true
        txtDrinkNameInput.text = newEntryViewControllerFields.drink?.name
        let isDrinkNameEmpty = txtDrinkNameInput.text == "" || txtDrinkNameInput.text == nil
        btnClearDrinkName.isHidden = isDrinkNameEmpty
        // clear drink if there was an old value
        drinkSizes = []
        txtDrinkSizeInput.text = ""
        newEntryViewControllerFields.drinkSize = nil
        if (!isDrinkNameEmpty)
        {
            makeDrinkSizesAvailable()
        }
        calculateCaffeineDailyPercent()
    }
    
    func makeDrinkSizesAvailable()
    {
        txtDrinkSizeInput.isHidden = false
        if let chosenDrink = newEntryViewControllerFields.drink
        {
            for size in chosenDrink.sizes
            {
                drinkSizes.append(size)
            }
        }
    }
    
    func updateAddress()
    {
        lblAddressError.isHidden = true
        let addressName = newEntryViewControllerFields.address
        txtAddressInput.text = (addressName == nil) ? "" : addressName!.name
        btnClearAddress.isHidden = txtAddressInput.text == "" || txtAddressInput.text == nil
    }
    
    @objc func dateChange(datePicker: UIDatePicker)
    {
        newEntryViewControllerFields.date = datePicker.date
        txtDateInput.text = formatDate(date: datePicker.date)
    }
    
    func formatDate(date: Date) -> String
    {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM dd yyyy"
        return formatter.string(from: date)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        self.view.endEditing(true)
    }
    
    // MARK: Image Functionality
    @IBOutlet weak var imgPicture: UIImageView!
    
    @IBAction func btnShare(_ sender: UIButton)
    {
        // Check if the image is not nil
        if let image = imgPicture.image
        {
            let activityViewController = UIActivityViewController(activityItems: [image], applicationActivities: nil)

            if let popOverPresentationController = activityViewController.popoverPresentationController
            {
                popOverPresentationController.sourceView = self.view // origin
                popOverPresentationController.sourceRect = CGRect(x: view.bounds.midX, y: view.bounds.midY, width: 0, height: 0)
            }
            present(activityViewController, animated: true, completion: nil)
        }
    }
    @IBAction func btnSnapPicture(_ sender: UIButton)
    {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        // Check if camera is available
//        if UIImagePickerController.isSourceTypeAvailable(.camera)
        if false
        {
            imagePicker.sourceType = .camera

            // Check if front camera is available
            if UIImagePickerController.isCameraDeviceAvailable(.front)
            {
                imagePicker.cameraDevice = .front
            }
            else
            {
                imagePicker.cameraDevice = .rear
            }
        }
        else
        {
            imagePicker.sourceType = .photoLibrary
            
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    // this function gets called automatically when the image is picked
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
    {
        imgPicture.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        newEntryViewControllerFields.image = imgPicture.image
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBOutlet weak var lblAddressError: UILabel!
    @IBOutlet weak var lblDateError: UILabel!
    @IBOutlet weak var lblDrinkError: UILabel!
    @IBOutlet weak var lblSizeError: UILabel!
    @IBAction func btnAddDrinkEntry(_ sender: UIButton)
    {
        var allFieldEntriesFilled = true

        if (newEntryViewControllerFields.image == nil)
        {
            allFieldEntriesFilled = false
        }
        if (newEntryViewControllerFields.address == nil)
        {
            lblAddressError.isHidden = false
            allFieldEntriesFilled = false
        }
        if (newEntryViewControllerFields.date == nil)
        {
            lblDateError.isHidden = false
            allFieldEntriesFilled = false
        }
        if (newEntryViewControllerFields.drink == nil)
        {
            lblDrinkError.isHidden = false
            allFieldEntriesFilled = false
        }
        if (newEntryViewControllerFields.drinkSize == nil)
        {
            lblSizeError.isHidden = false
            allFieldEntriesFilled = false
        }
        
        if allFieldEntriesFilled
        {
            // save to core data
            let newDrinkEntry = DrinkEntry(context: context)
            
            newDrinkEntry.username = activeUser
            newDrinkEntry.image = newEntryViewControllerFields.image
            newDrinkEntry.address = newEntryViewControllerFields.address
            newDrinkEntry.date = newEntryViewControllerFields.date
            newDrinkEntry.drinkName = newEntryViewControllerFields.drink?.name
            newDrinkEntry.drinkCategory = newEntryViewControllerFields.drink?.category
            newDrinkEntry.drinkSize = newEntryViewControllerFields.drinkSize
            
            appDelegate.saveContext()
            
            // continue to new view
            let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            let vc : UIViewController = mainStoryboard.instantiateViewController(withIdentifier: "TBCView") as UIViewController
            self.present(vc, animated: true, completion: nil)
            
            newEntryViewControllerFields = DrinkData()
        }
    }
    
    // Summary Section
    @IBOutlet weak var lblEstimatedCaffeine: UILabel!
    @IBOutlet weak var pvPercentOfMaxCaffeine: CoffeeUIProgressView!
    @IBOutlet weak var lblPercentOfMaxCaffeiene: UILabel!
    func calculateCaffeineDailyPercent()
    {
        var caffeineAmount : Int = 0
        
        let drinkAndSizeValid = newEntryViewControllerFields.drink != nil && newEntryViewControllerFields.drinkSize != nil
        
        if drinkAndSizeValid
        {
            let caffeineSizes : [StarbucksSize] = newEntryViewControllerFields.drink!.sizes
            let caffeineSizeChoice : String = newEntryViewControllerFields.drinkSize!
            for size in caffeineSizes
            {
                if size.sizeName == caffeineSizeChoice
                {
                    caffeineAmount = size.caffeineAmount
                }
            }
        }
        lblEstimatedCaffeine.text = "Estimated Caffeiene: \(caffeineAmount)mg"
        let caffeinePercentage =  Float(caffeineAmount) / recommendedFDADailyMaxOfCaffeiene
        pvPercentOfMaxCaffeine.progress = Float(caffeinePercentage)
        lblPercentOfMaxCaffeiene.text = "\(Int(caffeinePercentage * 100))% of recommended FDA daily maximum"
    }
}

extension NewEntryViewController: UIPickerViewDelegate, UIPickerViewDataSource
{
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return drinkSizes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return drinkSizes[row].sizeName
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        lblSizeError.isHidden = true
        newEntryViewControllerFields.drinkSize = drinkSizes[row].sizeName
        txtDrinkSizeInput.text = drinkSizes[row].sizeName
        calculateCaffeineDailyPercent()
    }
}

extension NewEntryViewController: PopoverViewControllerDelegate {
    func drinkTablePopoverWasDismissed()
    {
        DispatchQueue.main.async
        {
            self.updateDrinkName()
        }
    }
    func addressTablePopoverWasDismissed()
    {
        DispatchQueue.main.async
        {
            self.updateAddress()
        }
    }
}

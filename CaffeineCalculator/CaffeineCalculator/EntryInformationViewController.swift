//
//  EntryInformationViewController.swift
//  CaffeineCalculator
//
//  Created by Ricky Yoshioka on 11/23/23.
//

import UIKit
import MapKit

struct DrinkInformation
{
    var username: String?
    var image: UIImage?
    var address: MKMapItem?
    var date: Date?
    var drinkName: String?
    var category: String?
    var sizeName: String?
    var caffeineAmount: Float?
}

class EntryInformationViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate
{

    var selectedDrinkIndex: Int?
    
    // Top part
    @IBOutlet weak var lblTitleOfDrinkName: UILabel!
    @IBOutlet weak var lblDrinkCategoryName: UILabel!
    
    // Image
    @IBOutlet weak var imgDrinkImage: UIImageView!
    
    // Labels Below Image
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblDrinkSize: UILabel!
    @IBOutlet weak var lblDrinkOz: UILabel!
    
    // Estimate
    @IBOutlet weak var lblEstimatedCaffeine: UILabel!
    @IBOutlet weak var prgCaffeineProgress: CoffeeUIProgressView!
    @IBOutlet weak var lblCaffeinePercentage: UILabel!
    @IBOutlet weak var mapDrinkLocation: MKMapView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        let selectedDrink : DrinkEntrySnapshot = drinkEntries[selectedDrinkIndex!]
        
        var drinkEntry : DrinkInformation = DrinkInformation(username: nil, image: nil, address: nil, date: nil, drinkName: nil, category: nil, sizeName: nil, caffeineAmount: nil)
        
        var data = [DrinkEntry]()
        
        do
        {
            data = try context.fetch(DrinkEntry.fetchRequest())
            
            for existingDrink in data
            {
                if existingDrink.drinkName == selectedDrink.drinkName && // Drink name index 0
                    existingDrink.drinkCategory == selectedDrink.drinkCategory // Drink Category is index 1
                {
                    drinkEntry.username = existingDrink.username
                    drinkEntry.image = existingDrink.image as? UIImage
                    drinkEntry.address = existingDrink.address as? MKMapItem
                    drinkEntry.date = existingDrink.date
                    drinkEntry.drinkName = existingDrink.drinkName
                    drinkEntry.category = existingDrink.drinkCategory
                    drinkEntry.sizeName = existingDrink.drinkSize
                    drinkEntry.caffeineAmount = calculateCaffeineAmount(drinkName: existingDrink.drinkName!, drinkCategory: existingDrink.drinkCategory!, drinkSize: existingDrink.drinkSize!)
                }
            }
        }
        catch{}
                
        lblTitleOfDrinkName.text = drinkEntry.drinkName
        lblDrinkCategoryName.text = drinkEntry.category
        
        // Image
        imgDrinkImage.image = drinkEntry.image
        
        // Labels Below Image
        lblTime.text = formatTime(date: drinkEntry.date!)
        lblDate.text = formatDate(date: drinkEntry.date!)
        lblDrinkSize.text = drinkEntry.sizeName
        lblDrinkOz.text = drinkSizeAndCategoryToOunces(drinkSize: drinkEntry.sizeName!, category: drinkEntry.category!)
        
        let caffeineAmount = drinkEntry.caffeineAmount!
        // Estimate
        lblEstimatedCaffeine.text = "Estimated Caffeiene: \(Int(caffeineAmount))mg"
        let caffeinePercentage =  Float(caffeineAmount) / recommendedFDADailyMaxOfCaffeiene
        prgCaffeineProgress.progress = Float(caffeinePercentage)
        lblCaffeinePercentage.text = "\(Int(caffeinePercentage * 100))% of recommended FDA daily maximum"
        
        // Create map annotations
        mapDrinkLocation.delegate = self
        locationManager.delegate = self
        
        let drinkAddress = drinkEntry.address
        let drinkAddressLatitude = drinkAddress?.placemark.coordinate.latitude
        let drinkAddressLongitude = drinkAddress?.placemark.coordinate.longitude
        
        let drinkLocation = MKPointAnnotation()
        drinkLocation.coordinate = CLLocationCoordinate2D(latitude: drinkAddressLatitude!, longitude: drinkAddressLongitude!)
        drinkLocation.title = "\(parseAddress(selectedItem: drinkEntry.address!.placemark))"
        
        // Display on Map
        mapDrinkLocation.addAnnotation(drinkLocation)
        
        let drinkAddressCoordinate = drinkAddress?.placemark.coordinate
        let region = MKCoordinateRegion(center: drinkAddressCoordinate!, latitudinalMeters: 5000, longitudinalMeters: 5000)
        mapDrinkLocation.setRegion(region, animated: true)
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest // how accurate you want your
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    var locationManager = CLLocationManager()
}

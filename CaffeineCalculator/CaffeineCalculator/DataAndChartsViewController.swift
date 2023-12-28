//
//  DataAndChartsViewController.swift
//  CaffeineCalculator
//
//  Created by Ricky Yoshioka on 11/23/23.
//

import UIKit
import SwiftUI
import MapKit

class DataAndChartsViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mapDrinkPinsAll: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var drinkEntries : [DrinkInformation] = []
        
        var data = [DrinkEntry]()
        
        do
        {
            data = try context.fetch(DrinkEntry.fetchRequest())
            
            for existingDrink in data
            {
                var drinkEntry = DrinkInformation(username: nil, image: nil, address: nil, date: nil, drinkName: nil, category: nil, sizeName: nil, caffeineAmount: nil)
                
                if existingDrink.username == activeUser
                {
                    drinkEntry.username = existingDrink.username
                    drinkEntry.image = existingDrink.image as? UIImage
                    drinkEntry.address = existingDrink.address as? MKMapItem
                    drinkEntry.date = existingDrink.date
                    drinkEntry.drinkName = existingDrink.drinkName
                    drinkEntry.category = existingDrink.drinkCategory
                    drinkEntry.sizeName = existingDrink.drinkSize
                    drinkEntry.caffeineAmount = calculateCaffeineAmount(drinkName: existingDrink.drinkName!, drinkCategory: existingDrink.drinkCategory!, drinkSize: existingDrink.drinkSize!)
                    
                    drinkEntries.append(drinkEntry)
                }
            }
        }
        catch{}
        
        // Create map annotations
        mapDrinkPinsAll.delegate = self
        locationManager.delegate = self
        
        var drinkLocations : [MKPointAnnotation] = []
        
        for drinkEntry in drinkEntries
        {
            let drinkAddress = drinkEntry.address
            let drinkAddressLatitude = drinkAddress?.placemark.coordinate.latitude
            let drinkAddressLongitude = drinkAddress?.placemark.coordinate.longitude
            
            let drinkLocation = MKPointAnnotation()
            drinkLocation.coordinate = CLLocationCoordinate2D(latitude: drinkAddressLatitude!, longitude: drinkAddressLongitude!)
            drinkLocation.title = "\(parseAddress(selectedItem: drinkEntry.address!.placemark))"
            
            // Display on Map
            drinkLocations.append(drinkLocation)
        }

        // Use the function to calculate the best center point
        if let centerPoint = calculateCenterPoint(for: drinkLocations) {
            let region = MKCoordinateRegion(
                center: centerPoint,
                span: MKCoordinateSpan(latitudeDelta: 0.3, longitudeDelta: 0.3) // Adjust the span as needed
            )
             mapDrinkPinsAll.setRegion(region, animated: true)
        }
        
        mapDrinkPinsAll.addAnnotations(drinkLocations)
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest // how accurate you want your
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()

    }
    var locationManager = CLLocationManager()
    
    // Function to calculate the best center point for the map region
    func calculateCenterPoint(for annotations: [MKPointAnnotation]) -> CLLocationCoordinate2D? {
        guard !annotations.isEmpty else {
            return nil
        }

        let coordinates = annotations.map { $0.coordinate }
        
        let totalLatitude = coordinates.reduce(0) { $0 + $1.latitude }
        let totalLongitude = coordinates.reduce(0) { $0 + $1.longitude }

        let averageLatitude = totalLatitude / Double(coordinates.count)
        let averageLongitude = totalLongitude / Double(coordinates.count)

        return CLLocationCoordinate2D(latitude: averageLatitude, longitude: averageLongitude)
    }
        
    @IBSegueAction func embedSwiftUiCaffeineProgressView(_ coder: NSCoder) -> UIViewController? {
        return UIHostingController(coder: coder, rootView: CaffeineProgressSwiftUIView())
    }
    
    @IBSegueAction func embedSwiftUICaffeineGraphView(_ coder: NSCoder) -> UIViewController? {
        return UIHostingController(coder: coder, rootView: CaffeineGraphSwiftUIView())
    }
}

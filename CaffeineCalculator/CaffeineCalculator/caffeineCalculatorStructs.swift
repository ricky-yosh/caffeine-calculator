//
//  caffeineCalculatorStructs.swift
//  CaffeineCalculator
//
//  Created by Ricky Yoshioka on 11/29/23.
//

import Foundation
import UIKit
import MapKit

struct DrinkData {
    var image: UIImage?
    var address: MKMapItem?
    var date: Date?
    var drink: StarbucksDrink?
    var drinkSize: String?
}

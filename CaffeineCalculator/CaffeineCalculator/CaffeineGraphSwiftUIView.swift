//
//  CaffeineGraphSwiftUIView.swift
//  CaffeineCalculator
//
//  Created by Ricky Yoshioka on 12/3/23.
//

import SwiftUI
import Charts
import MapKit

func calculateCaffeineLevel(dataPoints: [(Date, Double)], checkTime: Date, halfLife: Double) -> Double
{
    var dataPointsBeforeCheckTime : [(Date, Double)] = []
    for dataPoint in dataPoints
    {
        if dataPoint.0 <= checkTime
        {
            dataPointsBeforeCheckTime.append(dataPoint)
        }
    }

    // Calculate the elapsed time since each caffeine consumption
    let elapsedTimeSinceConsumption = dataPointsBeforeCheckTime.map { checkTime.timeIntervalSince($0.0) / 3600.0 }

    // Calculate the caffeine level at the check time
    var totalCaffeine = 0.0
    for i in 0..<dataPointsBeforeCheckTime.count {
        let decayFactor = pow(0.5, elapsedTimeSinceConsumption[i] / halfLife)
        totalCaffeine += dataPointsBeforeCheckTime[i].1 * decayFactor
    }

    return totalCaffeine
}

func generateDataPointsForLast48Hours(baseDataPoints: [(Date, Double)]) -> [(Date, Double)] {
    var dataPoints = baseDataPoints
    let currentDate = Date()
    let halfHour: TimeInterval = 30 * 60 // 30 minutes

    for i in 1...96 { // 48 hours * 2 (every 30 minutes)
        let timeInterval = currentDate.timeIntervalSince1970 - Double(i) * halfHour
        let date = Date(timeIntervalSince1970: timeInterval)
        let caffeineAmount = 0.0 // No caffeine consumed at these times
        dataPoints.append((date, caffeineAmount))
    }
    return dataPoints.sorted { $0.0 < $1.0 }
}

struct CaffeineGraphSwiftUIView: View {
    var body: some View {
        
        var baseDataPoints : [(Date, Double)] = []
        
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
                
        // Add data for graph
        let currentDate = Date()

        for drinkEntry in drinkEntries
        {
            let input : (Date, Double) = (drinkEntry.date!, Double(drinkEntry.caffeineAmount!))
            baseDataPoints.append(input)
        }
        
        let fortyEightHoursAgo = Calendar.current.date(byAdding: .hour, value: -48, to: currentDate)!

        let filteredBaseDataPoints = baseDataPoints.filter { $0.0 > fortyEightHoursAgo }

        let dataPoints = generateDataPointsForLast48Hours(baseDataPoints: filteredBaseDataPoints)

        return Chart {
                ForEach(dataPoints, id: \.0) { item in
                    AreaMark(
                        x: .value("Date", item.0),
                        yStart: .value("Caffeine Amount", calculateCaffeineLevel(dataPoints: dataPoints, checkTime: item.0, halfLife: 1.5)),
                        yEnd: .value("Caffeine Amount", calculateCaffeineLevel(dataPoints: dataPoints, checkTime: item.0, halfLife: 9.5))
                    )
                    .foregroundStyle(Color(red: 69/255, green: 48/255, blue: 34/255, opacity: 0.4))
                    LineMark(
                        x: .value("Date", item.0),
                        y: .value("Caffeine Amount", calculateCaffeineLevel(dataPoints: dataPoints, checkTime: item.0, halfLife: 5.0)),
                        series: .value("Caffeine", "Amount")
                    )
                    .foregroundStyle(Color(red: 232/255, green: 112/255, blue: 28/255))
                }
            }
        .background(Color(red: 191/255, green: 177/255, blue: 165/255, opacity: 1.0))
        }
    }

struct CaffeineGraphSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        CaffeineGraphSwiftUIView()
    }
}

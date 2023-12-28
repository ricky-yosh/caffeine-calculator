//
//  CaffeineProgressSwiftUIView.swift
//  CaffeineCalculator
//
//  Created by Ricky Yoshioka on 12/3/23.
//

import SwiftUI
import MapKit

struct CaffeineProgressSwiftUIView: View {
    @State var progressValue: Float = 0.0
    @State var dailyCaffeineAmount: Int = 0
    @State var percentOfFDAMax: Float = 0.0

    var body: some View
    {
        VStack
        {
            ZStack
            {
                ProgressBar(progress: self.$progressValue, color: Color(red: 232/255, green: 112/255, blue: 28/255))
                    .frame(width: nil, height: nil)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .padding(20.0).onAppear()
                {
                    let totalDailyCaffeine: Int = getTotalDailyCaffeine()
                    self.dailyCaffeineAmount = totalDailyCaffeine
                    let percentageCaffeine: Float = Float(totalDailyCaffeine) / recommendedFDADailyMaxOfCaffeiene
                    self.percentOfFDAMax = percentageCaffeine
                    self.progressValue = percentageCaffeine
                }
                .background(Color(red: 191/255, green: 177/255, blue: 165/255, opacity: 1.0))

                VStack
                {
                    Text("\(dailyCaffeineAmount)mg")
                        .multilineTextAlignment(.center)
                        .font(.system(size: 24))
                        .padding(-5)
                    Text("\(Int(percentOfFDAMax * 100))% of FDA recommended max")
                        .multilineTextAlignment(.center)
                        .frame(width: 140, height: 24)
                        .font(.system(size: 10))
                }
            }
        }
    }
    
    func getTotalDailyCaffeine() -> Int
    {
        var totalDailyCaffeine: Int = 0
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
        
        // Daily count for current date
        let currentDate = Date()

        let calendar = Calendar.current
        let currentMonthDayComponents = calendar.dateComponents([.month, .day], from: currentDate)

        let dataForCurrentDay = drinkEntries.filter {
            let entryMonthDayComponents = calendar.dateComponents([.month, .day], from: $0.date!)
            return entryMonthDayComponents == currentMonthDayComponents
        }
        
        for dataPoint in dataForCurrentDay
        {
            totalDailyCaffeine += Int(dataPoint.caffeineAmount!)
        }
        
        return totalDailyCaffeine
    }
}

struct ProgressBar: View
{
    @Binding var progress: Float
    var color: Color = Color.green
    
    var body: some View
    {
        ZStack
        {
            Circle()
                .stroke(lineWidth: 10.0)
                .opacity(0.20)
                .foregroundColor(Color.white)
                .padding(-15)
            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 8.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(color)
                .rotationEffect(Angle(degrees: 270))
                .animation(.easeOut, value: 2.0)
                .padding(-15)
        }
    }
}

struct CaffeineProgressSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        CaffeineProgressSwiftUIView()
    }
}

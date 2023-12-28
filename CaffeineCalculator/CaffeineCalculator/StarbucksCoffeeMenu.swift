//
//  StarbucksCoffeeMenu.swift
//  CaffeineCalculator
//
//  Created by Ricky Yoshioka on 11/23/23.
//

import Foundation

struct StarbucksSize
{
    let sizeName: String
    let caffeineAmount: Int
}

struct StarbucksDrink
{
    let name: String
    let category: String
    let sizes: [StarbucksSize]
}

func calculateCaffeineAmount(drinkName: String, drinkCategory: String, drinkSize: String) -> Float?
{
    for drink in starbucksMenuItems
    {
        if drink.name == drinkName &&
            drink.category == drinkCategory
        {
            for size in drink.sizes
            {
                if size.sizeName == drinkSize
                {
                    return Float(size.caffeineAmount)
                }
            }
        }
    }
    return nil
    
}

func drinkSizeAndCategoryToOunces(drinkSize: String, category: String) -> String
{
    switch category
    {
    case "Hot Beverage":
        if (drinkSize == "Short")
        {
            return "8fl oz"
        }
        else if (drinkSize == "Tall")
        {
            return "12fl oz"
        }
        else if (drinkSize == "Grande")
        {
            return "16fl oz"
        }
        else // Venti Size
        {
            return "20fl oz"
        }
    case "Frappuccinos, Iced Coffees, Iced Teas, Refreshers":
        if (drinkSize == "Tall")
        {
            return "12fl oz"
        }
        else if (drinkSize == "Grande")
        {
            return "16fl oz"
        }
        else if (drinkSize == "Veni")
        {
            return "24fl oz"
        }
        else // Trenta Size
        {
            return "30fl oz"
        }
    case "Via, Bottled, and Canned Drinks":
        return drinkSize
    default:
        return "Error"
    }
}

let starbucksMenuItems: [StarbucksDrink] = [
    
    // MARK: Hot Beverages
    StarbucksDrink(name: "Blonde Caffè Americano",
                   category: "Hot Beverage",
                   sizes: [StarbucksSize(sizeName: "Short", caffeineAmount: 85),
                           StarbucksSize(sizeName: "Tall", caffeineAmount: 170),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 255),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 340)]),

    StarbucksDrink(name: "Blonde Caffè Latte (also flavored)",
                   category: "Hot Beverage",
                   sizes: [StarbucksSize(sizeName: "Short", caffeineAmount: 85),
                           StarbucksSize(sizeName: "Tall", caffeineAmount: 85),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 170),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 170)]),

    StarbucksDrink(name: "Blonde Cappuccino",
                   category: "Hot Beverage",
                   sizes: [StarbucksSize(sizeName: "Short", caffeineAmount: 85),
                           StarbucksSize(sizeName: "Tall", caffeineAmount: 85),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 170),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 170)]),

    StarbucksDrink(name: "Blonde Espresso (solo)",
                   category: "Hot Beverage",
                   sizes: [StarbucksSize(sizeName: "Tall", caffeineAmount: 85),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 170)]),

    StarbucksDrink(name: "Blonde Espresso (doppio)",
                   category: "Hot Beverage",
                   sizes: [StarbucksSize(sizeName: "Tall", caffeineAmount: 170),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 340)]),

    StarbucksDrink(name: "Blonde Flat White",
                   category: "Hot Beverage",
                   sizes: [StarbucksSize(sizeName: "Short", caffeineAmount: 150),
                           StarbucksSize(sizeName: "Tall", caffeineAmount: 150),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 225),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 225)]),

    StarbucksDrink(name: "Blonde Roast",
                   category: "Hot Beverage",
                   sizes: [StarbucksSize(sizeName: "Short", caffeineAmount: 180),
                           StarbucksSize(sizeName: "Tall", caffeineAmount: 270),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 360),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 475)]),

    StarbucksDrink(name: "Brewed Decaf Coffee",
                   category: "Hot Beverage",
                   sizes: [StarbucksSize(sizeName: "Short", caffeineAmount: 15),
                           StarbucksSize(sizeName: "Tall", caffeineAmount: 20),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 25),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 30)]),

    StarbucksDrink(name: "Caffe Misto",
                   category: "Hot Beverage",
                   sizes: [StarbucksSize(sizeName: "Short", caffeineAmount: 75),
                           StarbucksSize(sizeName: "Tall", caffeineAmount: 115),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 150),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 195)]),

    StarbucksDrink(name: "Caffè Americano",
                   category: "Hot Beverage",
                   sizes: [StarbucksSize(sizeName: "Short", caffeineAmount: 75),
                           StarbucksSize(sizeName: "Tall", caffeineAmount: 150),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 225),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 300)]),

    StarbucksDrink(name: "Caffè Latte (also flavored)",
                   category: "Hot Beverage",
                   sizes: [StarbucksSize(sizeName: "Short", caffeineAmount: 75),
                           StarbucksSize(sizeName: "Tall", caffeineAmount: 75),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 150),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 150)]),

    StarbucksDrink(name: "Caffè Mocha (also flavored Mochas)",
                   category: "Hot Beverage",
                   sizes: [StarbucksSize(sizeName: "Short", caffeineAmount: 90),
                           StarbucksSize(sizeName: "Tall", caffeineAmount: 95),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 175),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 185)]),

    StarbucksDrink(name: "Cappuccino",
                   category: "Hot Beverage",
                   sizes: [StarbucksSize(sizeName: "Short", caffeineAmount: 75),
                           StarbucksSize(sizeName: "Tall", caffeineAmount: 75),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 150),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 150)]),

    StarbucksDrink(name: "Caramel Flan Latte",
                   category: "Hot Beverage",
                   sizes: [StarbucksSize(sizeName: "Short", caffeineAmount: 75),
                           StarbucksSize(sizeName: "Tall", caffeineAmount: 75),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 150),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 150)]),

    StarbucksDrink(name: "Caramel Macchiato",
                   category: "Hot Beverage",
                   sizes: [StarbucksSize(sizeName: "Short", caffeineAmount: 75),
                           StarbucksSize(sizeName: "Tall", caffeineAmount: 75),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 150),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 150)]),

    StarbucksDrink(name: "Cinnamon Dolce Latte",
                   category: "Hot Beverage",
                   sizes: [StarbucksSize(sizeName: "Short", caffeineAmount: 75),
                           StarbucksSize(sizeName: "Tall", caffeineAmount: 75),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 150),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 150)]),

    StarbucksDrink(name: "Citrus Defender White Tea",
                   category: "Hot Beverage",
                   sizes: [StarbucksSize(sizeName: "Short", caffeineAmount: 25),
                           StarbucksSize(sizeName: "Tall", caffeineAmount: 25),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 40),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 40)]),

    StarbucksDrink(name: "Classic Chai Tea Latte",
                   category: "Hot Beverage",
                   sizes: [StarbucksSize(sizeName: "Short", caffeineAmount: 50),
                           StarbucksSize(sizeName: "Tall", caffeineAmount: 70),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 95),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 120)]),

    StarbucksDrink(name: "Clover – Blonde roasts",
                   category: "Hot Beverage",
                   sizes: [StarbucksSize(sizeName: "Short", caffeineAmount: 155),
                           StarbucksSize(sizeName: "Tall", caffeineAmount: 255),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 340),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 425)]),

    StarbucksDrink(name: "Clover – Medium roasts",
                   category: "Hot Beverage",
                   sizes: [StarbucksSize(sizeName: "Short", caffeineAmount: 170),
                           StarbucksSize(sizeName: "Tall", caffeineAmount: 280),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 375),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 445)]),

    StarbucksDrink(name: "Clover – Reserve roasts",
                   category: "Hot Beverage",
                   sizes: [StarbucksSize(sizeName: "Short", caffeineAmount: 190),
                           StarbucksSize(sizeName: "Tall", caffeineAmount: 280),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 380),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 470)]),

    StarbucksDrink(name: "Clover -Dark roasts",
                   category: "Hot Beverage",
                   sizes: [StarbucksSize(sizeName: "Short", caffeineAmount: 190),
                           StarbucksSize(sizeName: "Tall", caffeineAmount: 280),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 380),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 470)]),

    StarbucksDrink(name: "Cordusio Mocha",
                   category: "Hot Beverage",
                   sizes: [StarbucksSize(sizeName: "Short", caffeineAmount: 155),
                           StarbucksSize(sizeName: "Tall", caffeineAmount: 155),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 315),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 320)]),

    StarbucksDrink(name: "Defense Wellness White Tea",
                   category: "Hot Beverage",
                   sizes: [StarbucksSize(sizeName: "Short", caffeineAmount: 25),
                           StarbucksSize(sizeName: "Tall", caffeineAmount: 25),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 40),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 40)]),

    StarbucksDrink(name: "Espresso (solo)",
                   category: "Hot Beverage",
                   sizes: [StarbucksSize(sizeName: "Tall", caffeineAmount: 75),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 150)]),

    StarbucksDrink(name: "Espresso (doppio)",
                   category: "Hot Beverage",
                   sizes: [StarbucksSize(sizeName: "Tall", caffeineAmount: 150),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 300)]),

    StarbucksDrink(name: "Espresso Macchiato (solo)",
                   category: "Hot Beverage",
                   sizes: [StarbucksSize(sizeName: "Tall", caffeineAmount: 75),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 150)]),

    StarbucksDrink(name: "Espresso Macchiato (doppio)",
                   category: "Hot Beverage",
                   sizes: [StarbucksSize(sizeName: "Tall", caffeineAmount: 150),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 300)]),

    StarbucksDrink(name: "Espresso con Panna (solo)",
                   category: "Hot Beverage",
                   sizes: [StarbucksSize(sizeName: "Tall", caffeineAmount: 75),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 150)]),

    StarbucksDrink(name: "Espresso con Panna (doppio)",
                   category: "Hot Beverage",
                   sizes: [StarbucksSize(sizeName: "Tall", caffeineAmount: 150),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 300)]),

    StarbucksDrink(name: "Featured Dark Roast",
                   category: "Hot Beverage",
                   sizes: [StarbucksSize(sizeName: "Short", caffeineAmount: 130),
                           StarbucksSize(sizeName: "Tall", caffeineAmount: 195),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 260),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 340)]),

    StarbucksDrink(name: "Flat White",
                   category: "Hot Beverage",
                   sizes: [StarbucksSize(sizeName: "Short", caffeineAmount: 130),
                           StarbucksSize(sizeName: "Tall", caffeineAmount: 130),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 195),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 195)]),

    StarbucksDrink(name: "Hazelnut Macchiato",
                   category: "Hot Beverage",
                   sizes: [StarbucksSize(sizeName: "Short", caffeineAmount: 75),
                           StarbucksSize(sizeName: "Tall", caffeineAmount: 75),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 150),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 150)]),

    StarbucksDrink(name: "Hot Chocolate",
                   category: "Hot Beverage",
                   sizes: [StarbucksSize(sizeName: "Short", caffeineAmount: 15),
                           StarbucksSize(sizeName: "Tall", caffeineAmount: 20),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 25),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 30)]),

    StarbucksDrink(name: "Latte Macchiato",
                   category: "Hot Beverage",
                   sizes: [StarbucksSize(sizeName: "Short", caffeineAmount: 150),
                           StarbucksSize(sizeName: "Tall", caffeineAmount: 150),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 225),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 225)]),

    StarbucksDrink(name: "Molten Chocolate Latte",
                   category: "Hot Beverage",
                   sizes: [StarbucksSize(sizeName: "Short", caffeineAmount: 95),
                           StarbucksSize(sizeName: "Tall", caffeineAmount: 100),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 185),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 195)]),

    StarbucksDrink(name: "Oleato Caffé Latte with Oatmilk",
                   category: "Hot Beverage",
                   sizes: [StarbucksSize(sizeName: "Short", caffeineAmount: 85),
                           StarbucksSize(sizeName: "Tall", caffeineAmount: 85),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 170),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 170)]),

    StarbucksDrink(name: "Peppermint Mocha",
                   category: "Hot Beverage",
                   sizes: [StarbucksSize(sizeName: "Short", caffeineAmount: 75),
                           StarbucksSize(sizeName: "Tall", caffeineAmount: 75),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 150),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 150)]),

    StarbucksDrink(name: "Pike Place Brewed Coffee",
                   category: "Hot Beverage",
                   sizes: [StarbucksSize(sizeName: "Short", caffeineAmount: 155),
                           StarbucksSize(sizeName: "Tall", caffeineAmount: 235),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 310),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 410)]),
    
    StarbucksDrink(name: "Pineapple Kona Pop Brewed Tea",
                   category: "Hot Beverage",
                   sizes: [StarbucksSize(sizeName: "Short", caffeineAmount: 0),
                           StarbucksSize(sizeName: "Tall", caffeineAmount: 0),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 0),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 0)]),
    
    StarbucksDrink(name: "Pumpkin Spice",
                   category: "Hot Beverage",
                   sizes: [StarbucksSize(sizeName: "Short", caffeineAmount: 75),
                           StarbucksSize(sizeName: "Tall", caffeineAmount: 75),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 150),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 150)]),

    StarbucksDrink(name: "Reserve Latte",
                   category: "Hot Beverage",
                   sizes: [StarbucksSize(sizeName: "Short", caffeineAmount: 135),
                           StarbucksSize(sizeName: "Tall", caffeineAmount: 135),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 135),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 265)]),

    StarbucksDrink(name: "Salted Caramel Mocha",
                   category: "Hot Beverage",
                   sizes: [StarbucksSize(sizeName: "Short", caffeineAmount: 90),
                           StarbucksSize(sizeName: "Tall", caffeineAmount: 95),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 175),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 185)]),

    StarbucksDrink(name: "Smoked Butterscotch Latte",
                   category: "Hot Beverage",
                   sizes: [StarbucksSize(sizeName: "Short", caffeineAmount: 75),
                           StarbucksSize(sizeName: "Tall", caffeineAmount: 75),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 150),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 150)]),

    StarbucksDrink(name: "Starbucks Verismo espresso pod",
                   category: "Hot Beverage",
                   sizes: [StarbucksSize(sizeName: "Short", caffeineAmount: 40),
                           StarbucksSize(sizeName: "Tall", caffeineAmount: 50),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 60)]),

    StarbucksDrink(name: "Starbucks Verismo brewed pod",
                   category: "Hot Beverage",
                   sizes: [StarbucksSize(sizeName: "Short", caffeineAmount: 0),
                           StarbucksSize(sizeName: "Tall", caffeineAmount: 0),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 0)]),

    StarbucksDrink(name: "Teavana Earl Grey",
                   category: "Hot Beverage",
                   sizes: [StarbucksSize(sizeName: "Short", caffeineAmount: 40),
                           StarbucksSize(sizeName: "Tall", caffeineAmount: 40),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 80),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 80)]),
    
    StarbucksDrink(name: "Teavana Earl Grey Latte",
                   category: "Hot Beverage",
                   sizes: [StarbucksSize(sizeName: "Short", caffeineAmount: 40),
                           StarbucksSize(sizeName: "Tall", caffeineAmount: 40),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 80),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 80)]),
    
    StarbucksDrink(name: "Teavana Emperor’s Cloud & Mist",
                   category: "Hot Beverage",
                   sizes: [StarbucksSize(sizeName: "Short", caffeineAmount: 0),
                           StarbucksSize(sizeName: "Tall", caffeineAmount: 0),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 25),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 25)]),
    
    StarbucksDrink(name: "Teavana Green Tea Latte",
                   category: "Hot Beverage",
                   sizes: [StarbucksSize(sizeName: "Short", caffeineAmount: 25),
                           StarbucksSize(sizeName: "Tall", caffeineAmount: 55),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 80),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 110)]),
    
    StarbucksDrink(name: "Teavana Jade Citrus Mint",
                   category: "Hot Beverage",
                   sizes: [StarbucksSize(sizeName: "Short", caffeineAmount: 15),
                           StarbucksSize(sizeName: "Tall", caffeineAmount: 15),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 40),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 40)]),
    
    StarbucksDrink(name: "Teavana Mint Majesty",
                   category: "Hot Beverage",
                   sizes: [StarbucksSize(sizeName: "Short", caffeineAmount: 0),
                           StarbucksSize(sizeName: "Tall", caffeineAmount: 0),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 0),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 0)]),
    
    StarbucksDrink(name: "Teavana Passion Tango",
                   category: "Hot Beverage",
                   sizes: [StarbucksSize(sizeName: "Short", caffeineAmount: 0),
                           StarbucksSize(sizeName: "Tall", caffeineAmount: 0),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 0),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 0)]),
    
    StarbucksDrink(name: "Teavana Peach Tranquility",
                   category: "Hot Beverage",
                   sizes: [StarbucksSize(sizeName: "Short", caffeineAmount: 0),
                           StarbucksSize(sizeName: "Tall", caffeineAmount: 0),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 0),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 0)]),
    
    StarbucksDrink(name: "Teavana Royal English Breakfast",
                   category: "Hot Beverage",
                   sizes: [StarbucksSize(sizeName: "Short", caffeineAmount: 40),
                           StarbucksSize(sizeName: "Tall", caffeineAmount: 40),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 80),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 80)]),
    
    StarbucksDrink(name: "Teavana Royal English Breakfast Latte",
                   category: "Hot Beverage",
                   sizes: [StarbucksSize(sizeName: "Short", caffeineAmount: 40),
                           StarbucksSize(sizeName: "Tall", caffeineAmount: 40),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 80),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 80)]),
    
    StarbucksDrink(name: "Teavana Youthberry",
                   category: "Hot Beverage",
                   sizes: [StarbucksSize(sizeName: "Short", caffeineAmount: 0),
                           StarbucksSize(sizeName: "Tall", caffeineAmount: 0),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 25),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 25)]),
    
    StarbucksDrink(name: "Tiramisu Latte",
                   category: "Hot Beverage",
                   sizes: [StarbucksSize(sizeName: "Short", caffeineAmount: 75),
                           StarbucksSize(sizeName: "Tall", caffeineAmount: 75),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 150),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 150)]),
    
    StarbucksDrink(name: "Toasted Graham Latte",
                   category: "Hot Beverage",
                   sizes: [StarbucksSize(sizeName: "Short", caffeineAmount: 75),
                           StarbucksSize(sizeName: "Tall", caffeineAmount: 75),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 150),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 150)]),
    
    StarbucksDrink(name: "White Chocolate Mocha",
                   category: "Hot Beverage",
                   sizes: [StarbucksSize(sizeName: "Short", caffeineAmount: 75),
                           StarbucksSize(sizeName: "Tall", caffeineAmount: 75),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 150),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 150)]),
    
    StarbucksDrink(name: "White Hot Chocolate",
                   category: "Hot Beverage",
                   sizes: [StarbucksSize(sizeName: "Short", caffeineAmount: 0),
                           StarbucksSize(sizeName: "Tall", caffeineAmount: 0),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 0),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 0)]),
    
    // MARK: Frappuccinos, Iced Coffees, Iced Teas, Refreshers
    StarbucksDrink(name: "Caramel Flan Frappuccino",
                   category: "Frappuccinos, Iced Coffees, Iced Teas, Refreshers",
                   sizes: [StarbucksSize(sizeName: "Tall", caffeineAmount: 65),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 90),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 125)]),

    StarbucksDrink(name: "Caramel Frappuccino",
                   category: "Frappuccinos, Iced Coffees, Iced Teas, Refreshers",
                   sizes: [StarbucksSize(sizeName: "Tall", caffeineAmount: 70),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 100),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 130)]),
    
    StarbucksDrink(name: "Caramel Ribbon Crunch (Creme: caffeine-free)",
                   category: "Frappuccinos, Iced Coffees, Iced Teas, Refreshers",
                   sizes: [StarbucksSize(sizeName: "Tall", caffeineAmount: 60),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 85),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 115)]),

    StarbucksDrink(name: "Chocolate Milk",
                   category: "Frappuccinos, Iced Coffees, Iced Teas, Refreshers",
                   sizes: [StarbucksSize(sizeName: "Tall", caffeineAmount: 20),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 25),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 40)]),

    StarbucksDrink(name: "Chocolate Smoothie",
                   category: "Frappuccinos, Iced Coffees, Iced Teas, Refreshers",
                   sizes: [StarbucksSize(sizeName: "Grande", caffeineAmount: 15)]),

    StarbucksDrink(name: "Cinnamon Dolce (Creme: caffeine-free)",
                   category: "Frappuccinos, Iced Coffees, Iced Teas, Refreshers",
                   sizes: [StarbucksSize(sizeName: "Tall", caffeineAmount: 65),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 90),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 125)]),

    StarbucksDrink(name: "Coffee Frappuccino",
                   category: "Frappuccinos, Iced Coffees, Iced Teas, Refreshers",
                   sizes: [StarbucksSize(sizeName: "Tall", caffeineAmount: 70),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 95),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 130)]),

    StarbucksDrink(name: "Cold Brew Coffee",
                   category: "Frappuccinos, Iced Coffees, Iced Teas, Refreshers",
                   sizes: [StarbucksSize(sizeName: "Tall", caffeineAmount: 155),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 205),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 310),
                           StarbucksSize(sizeName: "Trenta", caffeineAmount: 360)]),

    StarbucksDrink(name: "Cold Brew Coffee w/milk",
                   category: "Frappuccinos, Iced Coffees, Iced Teas, Refreshers",
                   sizes: [StarbucksSize(sizeName: "Tall", caffeineAmount: 150),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 200),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 300),
                           StarbucksSize(sizeName: "Trenta", caffeineAmount: 330)]),

    StarbucksDrink(name: "Cold Foam Cascara Nitro",
                   category: "Frappuccinos, Iced Coffees, Iced Teas, Refreshers",
                   sizes: [StarbucksSize(sizeName: "Tall", caffeineAmount: 200),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 270)]),

    StarbucksDrink(name: "Cold Foam Cold Brew",
                   category: "Frappuccinos, Iced Coffees, Iced Teas, Refreshers",
                   sizes: [StarbucksSize(sizeName: "Tall", caffeineAmount: 155),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 205),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 310),
                           StarbucksSize(sizeName: "Trenta", caffeineAmount: 360)]),
    
    StarbucksDrink(name: "Cold Foam Dark Cocoa Nitro",
                   category: "Frappuccinos, Iced Coffees, Iced Teas, Refreshers",
                   sizes: [StarbucksSize(sizeName: "Tall", caffeineAmount: 215),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 290)]),

    StarbucksDrink(name: "Dark Mocha Nitro w/milk",
                   category: "Frappuccinos, Iced Coffees, Iced Teas, Refreshers",
                   sizes: [StarbucksSize(sizeName: "Tall", caffeineAmount: 225),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 295)]),

    StarbucksDrink(name: "Double Chocolaty Chip",
                   category: "Frappuccinos, Iced Coffees, Iced Teas, Refreshers",
                   sizes: [StarbucksSize(sizeName: "Tall", caffeineAmount: 10),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 15),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 15)]),

    StarbucksDrink(name: "Doubleshot on Ice",
                   category: "Frappuccinos, Iced Coffees, Iced Teas, Refreshers",
                   sizes: [StarbucksSize(sizeName: "Tall", caffeineAmount: 150),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 225),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 375)]),

    StarbucksDrink(name: "Espresso Frappuccino (coffee and espresso)",
                   category: "Frappuccinos, Iced Coffees, Iced Teas, Refreshers",
                   sizes: [StarbucksSize(sizeName: "Tall", caffeineAmount: 130),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 165),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 185)]),

    StarbucksDrink(name: "Green Tea Creme",
                   category: "Frappuccinos, Iced Coffees, Iced Teas, Refreshers",
                   sizes: [StarbucksSize(sizeName: "Tall", caffeineAmount: 50),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 70),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 95)]),

    StarbucksDrink(name: "Hazelnut Frappuccino",
                   category: "Frappuccinos, Iced Coffees, Iced Teas, Refreshers",
                   sizes: [StarbucksSize(sizeName: "Tall", caffeineAmount: 65),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 90),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 125)]),

    StarbucksDrink(name: "Iced Americano",
                   category: "Frappuccinos, Iced Coffees, Iced Teas, Refreshers",
                   sizes: [StarbucksSize(sizeName: "Tall", caffeineAmount: 150),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 225),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 300)]),
    
    StarbucksDrink(name: "Iced Blonde Americano",
                   category: "Frappuccinos, Iced Coffees, Iced Teas, Refreshers",
                   sizes: [StarbucksSize(sizeName: "Tall", caffeineAmount: 170),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 255),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 340)]),
    
    StarbucksDrink(name: "Iced Blonde Cappuccino",
                   category: "Frappuccinos, Iced Coffees, Iced Teas, Refreshers",
                   sizes: [StarbucksSize(sizeName: "Tall", caffeineAmount: 85),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 170),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 255)]),
    
    StarbucksDrink(name: "Iced Blonde Latte",
                   category: "Frappuccinos, Iced Coffees, Iced Teas, Refreshers",
                   sizes: [StarbucksSize(sizeName: "Tall", caffeineAmount: 85),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 170),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 255)]),
    
    StarbucksDrink(name: "Iced Cappuccino",
                   category: "Frappuccinos, Iced Coffees, Iced Teas, Refreshers",
                   sizes: [StarbucksSize(sizeName: "Tall", caffeineAmount: 75),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 150),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 225)]),
    
    StarbucksDrink(name: "Iced Caramel Macchiato",
                   category: "Frappuccinos, Iced Coffees, Iced Teas, Refreshers",
                   sizes: [StarbucksSize(sizeName: "Tall", caffeineAmount: 75),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 150),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 225)]),
    
    StarbucksDrink(name: "Iced Classic Chai Latte",
                   category: "Frappuccinos, Iced Coffees, Iced Teas, Refreshers",
                   sizes: [StarbucksSize(sizeName: "Tall", caffeineAmount: 70),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 95),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 145)]),
    
    StarbucksDrink(name: "Iced Clover Blonde",
                   category: "Frappuccinos, Iced Coffees, Iced Teas, Refreshers",
                   sizes: [StarbucksSize(sizeName: "Tall", caffeineAmount: 255),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 340),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 425)]),
    
    StarbucksDrink(name: "Iced Clover Dark",
                   category: "Frappuccinos, Iced Coffees, Iced Teas, Refreshers",
                   sizes: [StarbucksSize(sizeName: "Tall", caffeineAmount: 280),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 380),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 470)]),
    
    StarbucksDrink(name: "Iced Clover Medium",
                   category: "Frappuccinos, Iced Coffees, Iced Teas, Refreshers",
                   sizes: [StarbucksSize(sizeName: "Tall", caffeineAmount: 280),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 375),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 445)]),
    
    StarbucksDrink(name: "Iced Clover Reserve",
                   category: "Frappuccinos, Iced Coffees, Iced Teas, Refreshers",
                   sizes: [StarbucksSize(sizeName: "Tall", caffeineAmount: 280),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 380),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 470)]),
    
    StarbucksDrink(name: "Iced Coffee",
                   category: "Frappuccinos, Iced Coffees, Iced Teas, Refreshers",
                   sizes: [StarbucksSize(sizeName: "Tall", caffeineAmount: 120),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 165),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 235),
                           StarbucksSize(sizeName: "Trenta", caffeineAmount: 285)]),
    
    StarbucksDrink(name: "Iced Coffee with Milk",
                   category: "Frappuccinos, Iced Coffees, Iced Teas, Refreshers",
                   sizes: [StarbucksSize(sizeName: "Tall", caffeineAmount: 90),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 125),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 170),
                           StarbucksSize(sizeName: "Trenta", caffeineAmount: 190)]),
    
    StarbucksDrink(name: "Iced Flat White",
                   category: "Frappuccinos, Iced Coffees, Iced Teas, Refreshers",
                   sizes: [StarbucksSize(sizeName: "Tall", caffeineAmount: 90),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 130),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 175)]),
    
    StarbucksDrink(name: "Iced Latte (and flavors)",
                   category: "Frappuccinos, Iced Coffees, Iced Teas, Refreshers",
                   sizes: [StarbucksSize(sizeName: "Tall", caffeineAmount: 75),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 150),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 225)]),
    
    StarbucksDrink(name: "Iced Mocha (and flavors)",
                   category: "Frappuccinos, Iced Coffees, Iced Teas, Refreshers",
                   sizes: [StarbucksSize(sizeName: "Tall", caffeineAmount: 95),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 175),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 260)]),
    
    StarbucksDrink(name: "Iced Pumpkin Spice Latte",
                   category: "Frappuccinos, Iced Coffees, Iced Teas, Refreshers",
                   sizes: [StarbucksSize(sizeName: "Tall", caffeineAmount: 75),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 150),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 225)]),
    
    StarbucksDrink(name: "Iced Refreshers (all flavors)",
                   category: "Frappuccinos, Iced Coffees, Iced Teas, Refreshers",
                   sizes: [StarbucksSize(sizeName: "Tall", caffeineAmount: 45),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 55),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 85),
                           StarbucksSize(sizeName: "Trenta", caffeineAmount: 110)]),
    
    StarbucksDrink(name: "Iced Teavana Green Tea Latte",
                   category: "Frappuccinos, Iced Coffees, Iced Teas, Refreshers",
                   sizes: [StarbucksSize(sizeName: "Tall", caffeineAmount: 55),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 80),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 110)]),
    
    StarbucksDrink(name: "Iced White Chocolate Mocha",
                   category: "Frappuccinos, Iced Coffees, Iced Teas, Refreshers",
                   sizes: [StarbucksSize(sizeName: "Tall", caffeineAmount: 75),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 150),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 225)]),
    
    StarbucksDrink(name: "Irish Cream Cold Brew",
                   category: "Frappuccinos, Iced Coffees, Iced Teas, Refreshers",
                   sizes: [StarbucksSize(sizeName: "Tall", caffeineAmount: 145),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 185),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 275),
                           StarbucksSize(sizeName: "Trenta", caffeineAmount: 315)]),
    
    StarbucksDrink(name: "Java Chip",
                   category: "Frappuccinos, Iced Coffees, Iced Teas, Refreshers",
                   sizes: [StarbucksSize(sizeName: "Tall", caffeineAmount: 75),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 110),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 145)]),
    
    StarbucksDrink(name: "Mocha Cookie Crumble",
                   category: "Frappuccinos, Iced Coffees, Iced Teas, Refreshers",
                   sizes: [StarbucksSize(sizeName: "Tall", caffeineAmount: 75),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 105),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 140)]),
    
    StarbucksDrink(name: "Mocha Frappuccino",
                   category: "Frappuccinos, Iced Coffees, Iced Teas, Refreshers",
                   sizes: [StarbucksSize(sizeName: "Tall", caffeineAmount: 75),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 110),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 140)]),
    
    StarbucksDrink(name: "Molten Chocolate Frappuccino",
                   category: "Frappuccinos, Iced Coffees, Iced Teas, Refreshers",
                   sizes: [StarbucksSize(sizeName: "Tall", caffeineAmount: 80),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 110),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 150)]),
    
    StarbucksDrink(name: "Nitro Cold Brew",
                   category: "Frappuccinos, Iced Coffees, Iced Teas, Refreshers",
                   sizes: [StarbucksSize(sizeName: "Tall", caffeineAmount: 215),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 280)]),
    
    StarbucksDrink(name: "Nitro Cold Brew w/sweet cream",
                   category: "Frappuccinos, Iced Coffees, Iced Teas, Refreshers",
                   sizes: [StarbucksSize(sizeName: "Tall", caffeineAmount: 230),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 325)]),
    
    StarbucksDrink(name: "Nitro Freddo",
                   category: "Frappuccinos, Iced Coffees, Iced Teas, Refreshers",
                   sizes: [StarbucksSize(sizeName: "Tall", caffeineAmount: 215),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 285)]),
    
    StarbucksDrink(name: "Nitro Latte",
                   category: "Frappuccinos, Iced Coffees, Iced Teas, Refreshers",
                   sizes: [StarbucksSize(sizeName: "Tall", caffeineAmount: 115),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 155)]),
    
    StarbucksDrink(name: "Oleato Golden Foam™ Cold Brew",
                   category: "Frappuccinos, Iced Coffees, Iced Teas, Refreshers",
                   sizes: [StarbucksSize(sizeName: "Tall", caffeineAmount: 145),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 185),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 275),
                           StarbucksSize(sizeName: "Trenta", caffeineAmount: 315)]),
    
    StarbucksDrink(name: "Oprah Iced Chai Latte",
                   category: "Frappuccinos, Iced Coffees, Iced Teas, Refreshers",
                   sizes: [StarbucksSize(sizeName: "Tall", caffeineAmount: 40),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 50),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 75)]),

    StarbucksDrink(name: "Pink Drink",
                   category: "Frappuccinos, Iced Coffees, Iced Teas, Refreshers",
                   sizes: [StarbucksSize(sizeName: "Tall", caffeineAmount: 35),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 45),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 70),
                           StarbucksSize(sizeName: "Trenta", caffeineAmount: 90)]),

    StarbucksDrink(name: "Protein Blended Cold Brew",
                   category: "Frappuccinos, Iced Coffees, Iced Teas, Refreshers",
                   sizes: [StarbucksSize(sizeName: "Grande", caffeineAmount: 180)]),

    StarbucksDrink(name: "Pumpkin Cream Cold Brew",
                   category: "Frappuccinos, Iced Coffees, Iced Teas, Refreshers",
                   sizes: [StarbucksSize(sizeName: "Tall", caffeineAmount: 145),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 185),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 275),
                           StarbucksSize(sizeName: "Trenta", caffeineAmount: 315)]),

    StarbucksDrink(name: "Reserve Cold Brew",
                   category: "Frappuccinos, Iced Coffees, Iced Teas, Refreshers",
                   sizes: [StarbucksSize(sizeName: "Tall", caffeineAmount: 150),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 200),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 300)]),

    StarbucksDrink(name: "Reserve Nitro Cold Brew",
                   category: "Frappuccinos, Iced Coffees, Iced Teas, Refreshers",
                   sizes: [StarbucksSize(sizeName: "Tall", caffeineAmount: 280),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 400)]),

    StarbucksDrink(name: "Salted Cream Cold Foam CB",
                   category: "Frappuccinos, Iced Coffees, Iced Teas, Refreshers",
                   sizes: [StarbucksSize(sizeName: "Tall", caffeineAmount: 140),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 185),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 275),
                           StarbucksSize(sizeName: "Trenta", caffeineAmount: 320)]),

    StarbucksDrink(name: "Salted Cream Nitro",
                   category: "Frappuccinos, Iced Coffees, Iced Teas, Refreshers",
                   sizes: [StarbucksSize(sizeName: "Tall", caffeineAmount: 200),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 270)]),

    StarbucksDrink(name: "Shaken Sweet Tea (also Lemonade)",
                   category: "Frappuccinos, Iced Coffees, Iced Teas, Refreshers",
                   sizes: [StarbucksSize(sizeName: "Tall", caffeineAmount: 20),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 25),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 40),
                           StarbucksSize(sizeName: "Trenta", caffeineAmount: 50)]),

    StarbucksDrink(name: "Strawberries & Creme",
                   category: "Frappuccinos, Iced Coffees, Iced Teas, Refreshers",
                   sizes: [StarbucksSize(sizeName: "Tall", caffeineAmount: 0),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 0),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 0)]),

    StarbucksDrink(name: "Teavana Black Iced Tea (and Lemonade)",
                   category: "Frappuccinos, Iced Coffees, Iced Teas, Refreshers",
                   sizes: [StarbucksSize(sizeName: "Tall", caffeineAmount: 35),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 45),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 70),
                           StarbucksSize(sizeName: "Trenta", caffeineAmount: 90)]),

    StarbucksDrink(name: "Teavana Green Iced Tea (and Lemonade)",
                   category: "Frappuccinos, Iced Coffees, Iced Teas, Refreshers",
                   sizes: [StarbucksSize(sizeName: "Tall", caffeineAmount: 35),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 45),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 65),
                           StarbucksSize(sizeName: "Trenta", caffeineAmount: 90)]),

    StarbucksDrink(name: "Teavana Iced Green Tea (and Lemonade)",
                   category: "Frappuccinos, Iced Coffees, Iced Teas, Refreshers",
                   sizes: [StarbucksSize(sizeName: "Tall", caffeineAmount: 35),
                           StarbucksSize(sizeName: "Grande", caffeineAmount: 45),
                           StarbucksSize(sizeName: "Venti", caffeineAmount: 65),
                           StarbucksSize(sizeName: "Trenta", caffeineAmount: 90)]),
    
    StarbucksDrink(name: "Teavana Iced Passion (and Lemonade)",
                     category: "Frappuccinos, Iced Coffees, Iced Teas, Refreshers",
                     sizes: [StarbucksSize(sizeName: "Tall", caffeineAmount: 0),
                             StarbucksSize(sizeName: "Grande", caffeineAmount: 0),
                             StarbucksSize(sizeName: "Venti", caffeineAmount: 0),
                             StarbucksSize(sizeName: "Trenta", caffeineAmount: 0)]),
      
      StarbucksDrink(name: "Teavana Iced Peach Green Tea",
                     category: "Frappuccinos, Iced Coffees, Iced Teas, Refreshers",
                     sizes: [StarbucksSize(sizeName: "Tall", caffeineAmount: 35),
                             StarbucksSize(sizeName: "Grande", caffeineAmount: 45),
                             StarbucksSize(sizeName: "Venti", caffeineAmount: 65),
                             StarbucksSize(sizeName: "Trenta", caffeineAmount: 90)]),
      
      StarbucksDrink(name: "Torched Vanilla Nitro",
                     category: "Frappuccinos, Iced Coffees, Iced Teas, Refreshers",
                     sizes: [StarbucksSize(sizeName: "Tall", caffeineAmount: 210),
                             StarbucksSize(sizeName: "Grande", caffeineAmount: 280)]),
      
      StarbucksDrink(name: "Vanilla Bean Creme",
                     category: "Frappuccinos, Iced Coffees, Iced Teas, Refreshers",
                     sizes: [StarbucksSize(sizeName: "Tall", caffeineAmount: 0),
                             StarbucksSize(sizeName: "Grande", caffeineAmount: 0),
                             StarbucksSize(sizeName: "Venti", caffeineAmount: 0)]),
      
      StarbucksDrink(name: "Vanilla Frappuccino",
                     category: "Frappuccinos, Iced Coffees, Iced Teas, Refreshers",
                     sizes: [StarbucksSize(sizeName: "Tall", caffeineAmount: 65),
                             StarbucksSize(sizeName: "Grande", caffeineAmount: 95),
                             StarbucksSize(sizeName: "Venti", caffeineAmount: 125)]),
      
      StarbucksDrink(name: "Vanilla Sweet Cream Cold Brew",
                     category: "Frappuccinos, Iced Coffees, Iced Teas, Refreshers",
                     sizes: [StarbucksSize(sizeName: "Tall", caffeineAmount: 140),
                             StarbucksSize(sizeName: "Grande", caffeineAmount: 185),
                             StarbucksSize(sizeName: "Venti", caffeineAmount: 275),
                             StarbucksSize(sizeName: "Trenta", caffeineAmount: 320)]),
      
      StarbucksDrink(name: "White Chocolate Creme",
                     category: "Frappuccinos, Iced Coffees, Iced Teas, Refreshers",
                     sizes: [StarbucksSize(sizeName: "Tall", caffeineAmount: 0),
                             StarbucksSize(sizeName: "Grande", caffeineAmount: 0),
                             StarbucksSize(sizeName: "Venti", caffeineAmount: 0)]),
      
      StarbucksDrink(name: "White Chocolate Mocha",
                     category: "Frappuccinos, Iced Coffees, Iced Teas, Refreshers",
                     sizes: [StarbucksSize(sizeName: "Tall", caffeineAmount: 70),
                             StarbucksSize(sizeName: "Grande", caffeineAmount: 90),
                             StarbucksSize(sizeName: "Venti", caffeineAmount: 125)]),
    
    // MARK: Via, Bottled, and Canned Drinks
    StarbucksDrink(name: "Bottled Iced Espresso Classics (all flavors)",
                   category: "Via, Bottled, and Canned Drinks",
                   sizes: [StarbucksSize(sizeName: "12 fl oz", caffeineAmount: 125)]),

    StarbucksDrink(name: "Canned Refreshers (all flavors)",
                   category: "Via, Bottled, and Canned Drinks",
                   sizes: [StarbucksSize(sizeName: "12 fl oz", caffeineAmount: 50)]),

    StarbucksDrink(name: "Doubleshot Coffee + Protein (Chocolate)",
                   category: "Via, Bottled, and Canned Drinks",
                   sizes: [StarbucksSize(sizeName: "8 fl oz", caffeineAmount: 110)]),

    StarbucksDrink(name: "Doubleshot Coffee + Protein (Coffee)",
                   category: "Via, Bottled, and Canned Drinks",
                   sizes: [StarbucksSize(sizeName: "8 fl oz", caffeineAmount: 110)]),

    StarbucksDrink(name: "Doubleshot Coffee + Protein (Vanilla)",
                   category: "Via, Bottled, and Canned Drinks",
                   sizes: [StarbucksSize(sizeName: "8 fl oz", caffeineAmount: 110)]),

    StarbucksDrink(name: "Starbucks Bottled Cold Brew (black sweetened)",
                   category: "Via, Bottled, and Canned Drinks",
                   sizes: [StarbucksSize(sizeName: "11 fl oz", caffeineAmount: 215)]),

    StarbucksDrink(name: "Starbucks Bottled Cold Brew (black unsweetened)",
                   category: "Via, Bottled, and Canned Drinks",
                   sizes: [StarbucksSize(sizeName: "11 fl oz", caffeineAmount: 175)]),

    StarbucksDrink(name: "Starbucks Bottled Cold Brew (cocoa & honey)",
                   category: "Via, Bottled, and Canned Drinks",
                   sizes: [StarbucksSize(sizeName: "11 fl oz", caffeineAmount: 185)]),

    StarbucksDrink(name: "Starbucks Bottled Cold Brew (vanilla & fig)",
                   category: "Via, Bottled, and Canned Drinks",
                   sizes: [StarbucksSize(sizeName: "11 fl oz", caffeineAmount: 185)]),

    StarbucksDrink(name: "Starbucks Bottled Frappuccino",
                   category: "Via, Bottled, and Canned Drinks",
                   sizes: [StarbucksSize(sizeName: "13.7 fl oz", caffeineAmount: 130)]),
    
    StarbucksDrink(name: "Starbucks Bottled Iced Coffee (see all flavors)",
                   category: "Via, Bottled, and Canned Drinks",
                   sizes: [StarbucksSize(sizeName: "12 fl oz", caffeineAmount: 220)]),

    StarbucksDrink(name: "Starbucks Canned Doubleshot Cubano",
                   category: "Via, Bottled, and Canned Drinks",
                   sizes: [StarbucksSize(sizeName: "6.5 fl oz", caffeineAmount: 85)]),

    StarbucksDrink(name: "Starbucks Canned Doubleshot Energy Coffee",
                   category: "Via, Bottled, and Canned Drinks",
                   sizes: [StarbucksSize(sizeName: "15 fl oz", caffeineAmount: 135)]),

    StarbucksDrink(name: "Starbucks Canned Doubleshot Energy Hazelnut",
                   category: "Via, Bottled, and Canned Drinks",
                   sizes: [StarbucksSize(sizeName: "15 fl oz", caffeineAmount: 135)]),

    StarbucksDrink(name: "Starbucks Canned Doubleshot Energy Mocha",
                   category: "Via, Bottled, and Canned Drinks",
                   sizes: [StarbucksSize(sizeName: "15 fl oz", caffeineAmount: 135)]),

    StarbucksDrink(name: "Starbucks Canned Doubleshot Energy Vanilla",
                   category: "Via, Bottled, and Canned Drinks",
                   sizes: [StarbucksSize(sizeName: "15 fl oz", caffeineAmount: 135)]),

    StarbucksDrink(name: "Starbucks Canned Doubleshot Energy White Chocolate",
                   category: "Via, Bottled, and Canned Drinks",
                   sizes: [StarbucksSize(sizeName: "15 fl oz", caffeineAmount: 135)]),

    StarbucksDrink(name: "Starbucks Canned Doubleshot Espresso & Cream",
                   category: "Via, Bottled, and Canned Drinks",
                   sizes: [StarbucksSize(sizeName: "6.5 fl oz", caffeineAmount: 120)]),

    StarbucksDrink(name: "Starbucks Canned Doubleshot Espresso Americano",
                   category: "Via, Bottled, and Canned Drinks",
                   sizes: [StarbucksSize(sizeName: "6.5 fl oz", caffeineAmount: 110)]),

    StarbucksDrink(name: "Starbucks Canned Doubleshot Espresso Light",
                   category: "Via, Bottled, and Canned Drinks",
                   sizes: [StarbucksSize(sizeName: "6.5 fl oz", caffeineAmount: 120)]),
    
    StarbucksDrink(name: "Starbucks Canned Doubleshot Salted Caramel",
                   category: "Via, Bottled, and Canned Drinks",
                   sizes: [StarbucksSize(sizeName: "6.5 fl oz", caffeineAmount: 70)]),
    
    StarbucksDrink(name: "Starbucks Canned Nitro Cold Brew",
                   category: "Via, Bottled, and Canned Drinks",
                   sizes: [StarbucksSize(sizeName: "11 fl oz", caffeineAmount: 235)]),
    
    StarbucksDrink(name: "Starbucks Classics Vanilla Latte (and Skinny)",
                   category: "Via, Bottled, and Canned Drinks",
                   sizes: [StarbucksSize(sizeName: "8 fl oz", caffeineAmount: 85)]),
    
    StarbucksDrink(name: "Starbucks Classics-Caffe Mocha",
                   category: "Via, Bottled, and Canned Drinks",
                   sizes: [StarbucksSize(sizeName: "8 fl oz", caffeineAmount: 85)]),
    
    StarbucksDrink(name: "Starbucks Classics-Caramel Macchiato (and Skinny)",
                   category: "Via, Bottled, and Canned Drinks",
                   sizes: [StarbucksSize(sizeName: "8 fl oz", caffeineAmount: 85)]),
    
    StarbucksDrink(name: "Starbucks Cold & Crafted (black sweetened)",
                   category: "Via, Bottled, and Canned Drinks",
                   sizes: [StarbucksSize(sizeName: "11 fl oz", caffeineAmount: 135)]),
    
    StarbucksDrink(name: "Starbucks Cold & Crafted (mocha & milk)",
                   category: "Via, Bottled, and Canned Drinks",
                   sizes: [StarbucksSize(sizeName: "11 fl oz", caffeineAmount: 125)]),
    
    StarbucksDrink(name: "Starbucks Cold & Crafted (vanilla & milk)",
                   category: "Via, Bottled, and Canned Drinks",
                   sizes: [StarbucksSize(sizeName: "11 fl oz", caffeineAmount: 125)]),
    
    StarbucksDrink(name: "Starbucks Iced Via",
                   category: "Via, Bottled, and Canned Drinks",
                   sizes: [StarbucksSize(sizeName: "1 sachet", caffeineAmount: 270)]),
    
    StarbucksDrink(name: "Starbucks Triple Shot Energy (all flavors)",
                   category: "Via, Bottled, and Canned Drinks",
                   sizes: [StarbucksSize(sizeName: "15 fl oz", caffeineAmount: 225)]),
    
    StarbucksDrink(name: "Starbucks Via Instant Coffee",
                   category: "Via, Bottled, and Canned Drinks",
                   sizes: [StarbucksSize(sizeName: "1 sachet", caffeineAmount: 140)]),
    
    StarbucksDrink(name: "Tazo Berry Blossom White",
                   category: "Via, Bottled, and Canned Drinks",
                   sizes: [StarbucksSize(sizeName: "13.8 fl oz", caffeineAmount: 45)]),
    
    StarbucksDrink(name: "Tazo Black Tea Mango",
                   category: "Via, Bottled, and Canned Drinks",
                   sizes: [StarbucksSize(sizeName: "13.8 fl oz", caffeineAmount: 30)]),
    
    StarbucksDrink(name: "Tazo Black Tea w/lemon",
                   category: "Via, Bottled, and Canned Drinks",
                   sizes: [StarbucksSize(sizeName: "13.8 fl oz", caffeineAmount: 45)]),
    
    StarbucksDrink(name: "Tazo Giant Peach",
                   category: "Via, Bottled, and Canned Drinks",
                   sizes: [StarbucksSize(sizeName: "13.8 fl oz", caffeineAmount: 45)]),
    
    StarbucksDrink(name: "Tazo Organic Black Tea",
                   category: "Via, Bottled, and Canned Drinks",
                   sizes: [StarbucksSize(sizeName: "13.8 fl oz", caffeineAmount: 45)]),
    
    StarbucksDrink(name: "Tazo Organic Green Tea",
                   category: "Via, Bottled, and Canned Drinks",
                   sizes: [StarbucksSize(sizeName: "13.8 fl oz", caffeineAmount: 45)]),
    
    StarbucksDrink(name: "Tazo Plum Pomegranate",
                   category: "Via, Bottled, and Canned Drinks",
                   sizes: [StarbucksSize(sizeName: "13.8 fl oz", caffeineAmount: 30)]),
    
    StarbucksDrink(name: "Tazo Tazoberry",
                   category: "Via, Bottled, and Canned Drinks",
                   sizes: [StarbucksSize(sizeName: "13.8 fl oz", caffeineAmount: 45)]),
    
    StarbucksDrink(name: "Tazo White Cranberry",
                   category: "Via, Bottled, and Canned Drinks",
                   sizes: [StarbucksSize(sizeName: "13.8 fl oz", caffeineAmount: 45)]),
    
    StarbucksDrink(name: "Via Refreshers",
                   category: "Via, Bottled, and Canned Drinks",
                   sizes: [StarbucksSize(sizeName: "1 sachet", caffeineAmount: 55)])
]

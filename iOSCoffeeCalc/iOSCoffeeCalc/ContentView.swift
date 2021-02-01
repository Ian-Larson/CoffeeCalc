//
//  ContentView.swift
//  iOSCoffeeCalc
//
//  Created by Ian Larson on 1/25/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var coffeeBagPrice = ""
    @State private var gallonPrice = ""
    @State private var sizeOfCoffeeBag = 2
    @State private var drinkSize = 2
    @State private var ratio = 2
    @State private var shopPrice = ""
    
    @State private var drinkSizes = [240, 350, 475]
    @State private var bagSizes = [115, 285, 340, 450]
    @State private var ratios = [15, 16, 17]
    
    //Calculates the Cost per gram of coffee
    var coffeeCost: Double {
        let gramSelection = Double(bagSizes[sizeOfCoffeeBag])
        let coffeeCost = Double(coffeeBagPrice) ?? 0
        let coffeePerGram = coffeeCost / gramSelection
        return coffeePerGram
    }
    
    //Calculates the cost per ml of water
    var waterCostPerCup: Double {
        let drinkSizeSelection = Double(drinkSizes[drinkSize])
        let distilledWaterPrice = Double(gallonPrice) ?? 0
        let thirdWaveWaterPricePerGallon = 1.25
        let costOfWaterPerGallon = distilledWaterPrice + thirdWaveWaterPricePerGallon
        let costPerML =  costOfWaterPerGallon / 3785.0
        return (costPerML * drinkSizeSelection)
    }
    
    //Calculates the # of grams used per cup
    var coffeeUsedPerCup: Double {
        let drinkSizeSelection = Double(drinkSizes[drinkSize])
        let coffeeRatioSelection = Double(ratios[ratio])
        return (drinkSizeSelection / coffeeRatioSelection)
    }
    
    //Calculates the overall cost per cup of coffee
    var overallCost: Double {
        let filterPrice = 0.05
        let costPerCoffee = (coffeeCost * coffeeUsedPerCup) + waterCostPerCup + filterPrice
        if costPerCoffee < 0.30 {
            return 0
        }
        else {
            return costPerCoffee
        }
    }
    
    //How much does your coffee cost a coffee shop
    var priceAtCoffeeShop: Double {
        let shopPricePerCoffee = Double(shopPrice) ?? 0
        return (shopPricePerCoffee * numberOfCups)
    }
    
    //Returns the difference between paying for the same number of cups at a shop vs making it yourself
    var comparePrices: Double {
        return (priceAtCoffeeShop - costPerBag)
    }
    
    //Calculates the number of cups you can brew per bag
    var numberOfCups: Double {
        let gramSelection = Double(bagSizes[sizeOfCoffeeBag])
        return (gramSelection / coffeeUsedPerCup)
    }
        
    //Calcualtes the total cost of the bag
    var costPerBag: Double {
        return (numberOfCups * overallCost)
    }
    
    
    var body: some View {
        NavigationView {
    
            ZStack {
                Form {
                    
                    Section(header: Text("Cost Per Coffee")) {
                        HStack {
                            Spacer()
                            Text("$\(overallCost, specifier: "%.2f")")
                                .font(.system(size: 45, weight: .bold, design: .default))
                                //.foregroundColor(Color.black)
                                
                            Spacer()
                        }
                    }
                    
                    List {
                        Section(header: Text("Enter Prices")) {
                            HStack {
                            TextField("Coffee Beans: $", text: $coffeeBagPrice)
                                .keyboardType(.decimalPad)
                            Button("Submit") {
                                            print("Price: $ \(self.coffeeBagPrice)")
                                            self.hideKeyboard()
                                        }
                            }
                            HStack {
                                TextField("Gallon of Water: $", text: $gallonPrice)
                                    .keyboardType(.decimalPad)
                                Button("Submit") {
                                                print("Price: $ \(self.gallonPrice)")
                                                self.hideKeyboard()
                            }
                        }
                        }
                    }
                    Section(header: Text("Coffee Bag Size")) {
                        Picker("Bag Sizes", selection: $sizeOfCoffeeBag) {
                            ForEach(0..<bagSizes.count) { index in
                                Text("\(self.bagSizes[index]) (g)")
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                    Section(header: Text("Drink Size")) {
                        Picker("Drink Sizes", selection: $drinkSize) {
                            ForEach(0..<drinkSizes.count) { index in
                                Text("\(self.drinkSizes[index]) (ml)")
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                    Section(header: Text("Coffee to Water Ratio")) {
                        Picker("Ratios", selection: $ratio) {
                            ForEach(0..<ratios.count) { index in
                                Text("1:\(self.ratios[index])")
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                        List {
                        Section(header: Text("Summary")) {
                            HStack {
                                Text("Cups of Coffee In This Bag: ")
                                Spacer()
                                Text("\(numberOfCups, specifier: "%.2f")")
                                    .fontWeight(.bold)
                            }
                            HStack {
                                Text("Cost of Water Per Cup")
                                Spacer()
                                Text("$\(waterCostPerCup, specifier: "%.2f")")
                                    .fontWeight(.bold)
                                }
                                HStack {
                                    Text("Cost of This Bag: ")
                                    Spacer()
                                    Text("$\(costPerBag, specifier: "%.2f")")
                                        .fontWeight(.bold)
                                }
                            }
                        Section(header: Text("Compared to Coffee Shop")) {
                            HStack {
                                TextField("Your Coffee Shop's Price: $", text: $shopPrice)
                                    .keyboardType(.decimalPad)
                                Button("Submit") {
                                                print("Price: $ \(self.shopPrice)")
                                                self.hideKeyboard()
                                }
                            }
                            HStack {
                                Text("You Save:  ")
                                Spacer()
                                Text("$\(comparePrices, specifier: "%.2f")")
                                    .fontWeight(.bold)
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("☕️ Coffee Calc")
        }
    }
}

// extension for keyboard to dismiss
#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

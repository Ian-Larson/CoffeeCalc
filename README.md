# CoffeeCalc
- CoffeeCalc is an iOS app that helps you calculate how much you are spending (or saving!) on making coffee at home


![Simulator Screen Shot - iPhone 12 Pro - 2021-03-02 at 14 38 41](https://user-images.githubusercontent.com/60232877/109712116-3bcaec80-7b65-11eb-8b21-8efcc07559ac.png)

### Cost Per Coffee
The cost is calculated by getting some information about how much everything costs individually.
- Coffee Beans: How much your bag of coffee costs
- Water: How much does 1 gallon of water cost you (Ex: I buy gallons of water to brew with so I know how much this costs)
- Coffee Bag Size: Some common weights of coffee bags from 115g (4oz), 285g (10oz), 340g (12oz), 1:17 is about average.
- Also adds in some estimated cost of filters ($0.05 per)

### Summary Information
Some basic information that can be calculated based on your inputs
- Cups of Coffee In This Bag: Pretty simple, how many cups will your bag of coffee make you before you run out
- Cost of Water Per Cup
- Cost of This Bag: Essentially combines the purchase price of the bag + water + filters to give you a sense of the overall spending

![Simulator Screen Shot - iPhone 12 Pro - 2021-03-02 at 14 38 46](https://user-images.githubusercontent.com/60232877/109713017-55b8ff00-7b66-11eb-876f-3bdd547c3843.png)

### Compared to Coffee Shop
This section of the app lets you input how much your same drink at your typical coffee ship costs. You can see how much you are saving over the course of your bag of coffee (spoiler: Its probably a lot!)

### Other Information
- Built using 100% Swift & Swift UI
- No personal data is taken from the user in any way, this is an offline app purely meant as a utility to the user

//Ian Larson
//CoffeeCalc
//Version 1.0

#include <iostream>
using namespace std;

int main() {

  // CURRENCY FORMATTING
  cout.setf(ios::fixed);
  cout.setf(ios::showpoint);
  cout.precision(2);

  //Cost of Coffee
  void costAndSizeOfCoffee() {
    float priceOfCoffee = 0;
    int ozOfCoffee = 0;
    int amountOfCoffee = 0;

      while (priceOfCoffee <= 0 ) {
        cout << "Price of Coffee: $";
        cin >> priceOfCoffee;
      }

      while (ozOfCoffee <= 0) {
        cout << "Size of Bag (Ounces): ";
        cin >> ozOfCoffee;
      }
      amountOfCoffee = ouncesToGrams();
  }

  //Converts Ounces of Coffee to Grams
  int ouncesToGrams(ozOfCoffee) {
    int ounces = ozOfCoffee;
    float gramConstant = 28.3495;
    int gramsOfCoffee = ounces * gramConstant;
    return gramsOfCoffee;
  }

  float calculateCoffeeCostPerGram(priceOfCoffee, amountOfCoffee) {
    return priceOfCoffee / amountOfCoffee;
  }

  float costPerCup() {}





}

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
    float priceOfCoffee = 0;
    int ozOfCoffee = 0;
    int amountOfCoffee = 0;
    float gramConstant = 28.3495;

      while (priceOfCoffee <= 0 ) {
        cout << "Price of Coffee: $";
        cin >> priceOfCoffee;
      }

      while (ozOfCoffee <= 0) {
        cout << "Size of Bag (Ounces): ";
        cin >> ozOfCoffee;
      }
      //Converts Ounces of Coffee to Grams
      amountOfCoffee = (ozOfCoffee * gramConstant);

  cout << amountOfCoffee;
}

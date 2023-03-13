class CoffeeTools {
  String _machine;
  int _cups;
  int _water;
  int _grams;

  CoffeeTools() {
    _machine = '';
    _cups = 0;
    _water = 0;
    _grams = 0;
  }

  // String machine() {
  //   return _machine;
  // }

  // int cups() {
  //   return _cups;
  // }

  // int water() {
  //   return _water;
  // }

  int grams() {
    return _grams;
  }

  static int cupsToOunces(int cups) {
    if (cups <= 0) {
      throw ArgumentError();
    }
    return cups * 6;
  }

  static int cupsToGrams(int userInput) {
    double totalOunces = 0;
    double totalGrams = 0;
    //double total = 0.0;

    totalOunces = userInput.toDouble() * 6;

    totalGrams = totalOunces * 28.3495;

    //_grams = totalGrams;

    return totalGrams.toInt();
  }

  static int calculationToFrench(int userInput) {
    double total = 0;
    double totalOunces = 0;
    double totalGrams = 0;

    totalOunces = userInput.toDouble() * 6;

    totalGrams = totalOunces * 28.3495;
    total = totalGrams / 14;

    return total.toInt();
  }

  static int calculationToDrip(int userInput) {
    // int totalDrip = 0;

    // totalDrip = cupsToGrams(_grams) ~/ 17;

    // return totalDrip;
    double total = 0;
    double totalOunces = 0;
    double totalGrams = 0;

    totalOunces = userInput.toDouble() * 6;

    totalGrams = totalOunces * 28.3495;
    total = totalGrams / 17;

    return total.toInt();
  }

  // Input: number of cups (positive integer)
  // Output: number of ounces in a cup
  // static int cupsToOunces(int cups) {
  //   if (cups <= 0) {
  //     throw ArgumentError();
  //   }
  //   return cups * 6;
  // }
}

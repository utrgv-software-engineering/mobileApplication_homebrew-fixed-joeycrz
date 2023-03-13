import 'dart:math';

import 'package:homebrew/utils/coffee_tools.dart';
import 'package:test/test.dart';

void main() {
  group("cupsToOunces", () {
    test('calculates ounces on 1 cup', () {
      var ounces = CoffeeTools.cupsToOunces(1);
      expect(ounces, 6);
    });

    test('calculates ounces on positive number of cups', () {
      var ounces = CoffeeTools.cupsToOunces(4);
      expect(ounces, 24);
    });

    test('throws ArgumentError on zero', () {
      expect(() => CoffeeTools.cupsToOunces(0), throwsArgumentError);
    });

    test('throws ArgumentError on negative number', () {
      expect(() => CoffeeTools.cupsToOunces(0), throwsArgumentError);
    });
  });

  test(
      'when user selects French Press and inputs a cup amount, return the coffee needed in grams ',
      () {
    final testInput = CoffeeTools.calculationToFrench(5);

    expect(testInput, 60);
  });
  test(
      'when user selects Drip Press and inputs a cup amount, return the coffee needed in grams ',
      () {
    final testInput = CoffeeTools.calculationToDrip(5);

    expect(testInput, 50);
  });

  test(
      'when user selects any device and inputs a cup amount, return the water needed in grams',
      () {
    final testInput = CoffeeTools.cupsToGrams(2);
    expect(testInput, 340);
  });
}

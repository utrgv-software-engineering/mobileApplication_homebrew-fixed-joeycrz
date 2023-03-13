// Imports the Flutter Driver API.

import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  FlutterDriver driver;

  // Connect to the Flutter driver before running any tests.
  setUpAll(() async {
    driver = await FlutterDriver.connect();
  });

  // Close the connection to the driver after the tests have completed.
  tearDownAll(() async {
    if (driver != null) {
      driver.close();
    }
  });
  group('Happy Paths', () {
    /*
      Given I am on the Coffee Device Selection Screen
      When I tap "French Press"
      And I tap "Continue"
      And I enter "5"
      And I tap "Continue"
      Then I should see "60g - course ground coffee"
      And I should see "850g - water"
    */
    test("should give recommendation for French Press", () async {
      // your code here
      final frenchPress = find.byValueKey('french_press');
      final continueButton1 = find.byValueKey('continue_button');
      final cupInput = find.byValueKey('coffee_num');
      final continueButton2 = find.byValueKey('continue_button2');
      final coffeeGround = find.byValueKey('final_coffee');
      final waterAmount = find.byValueKey('final_water');
      final doneButton = find.byValueKey('done_button');

      await driver.tap(frenchPress);
      await driver.tap(continueButton1);

      await driver.tap(cupInput);
      await driver.enterText('5');
      await driver.tap(continueButton2);

      expect(await driver.getText(coffeeGround), "60g - course ground coffee.");
      expect(await driver.getText(waterAmount), "850g - water");

      await driver.tap(doneButton);
    });

    /*
      Given I am on the Coffee Device Selection Screen
      When I tap "French Machine"
      And I tap "Continue"
      And I enter "5"
      And I tap "Continue"
      And I tap the back button
      And I enter "6" 
      And I tap "Continue"
      Then I should see "60g - course ground coffee"
      And I should see "850g - water"
    */
    test("should give recommendation for French Machine", () async {
      final frenchPress = find.byValueKey('french_press');
      final continueButton1 = find.byValueKey('continue_button');
      final cupInput = find.byValueKey('coffee_num');
      final continueButton2 = find.byValueKey('continue_button2');
      final coffeeGround = find.byValueKey('final_coffee');
      final waterAmount = find.byValueKey('final_water');
      final doneButton = find.byValueKey('done_button');
      final backButton2 = find.byValueKey('back_button2');

      await driver.tap(frenchPress);
      await driver.tap(continueButton1);

      await driver.tap(cupInput);
      await driver.enterText('5');
      await driver.tap(continueButton2);

      expect(await driver.getText(coffeeGround), "60g - course ground coffee.");
      expect(await driver.getText(waterAmount), "850g - water");

      await driver.tap(backButton2);

      await driver.tap(cupInput);
      await driver.enterText('6');
      await driver.tap(continueButton2);

      expect(await driver.getText(coffeeGround), "72g - course ground coffee.");
      expect(await driver.getText(waterAmount), "1020g - water");

      await driver.tap(doneButton);
    });

    /*
      Given I am on the Coffee Device Selection Screen
      When I tap "Drip Machine"
      And I tap "Continue"
      And I enter "5"
      And I tap "Continue"
      Then I should see "50g - medium ground coffee"
      And I should see "850g - water"
    */
    test("should give recommendation for Drip Machine", () async {
      final dripMachine = find.byValueKey('drip');
      final continueButton1 = find.byValueKey('continue_button');
      final cupInput = find.byValueKey('coffee_num');
      final continueButton2 = find.byValueKey('continue_button2');
      final coffeeGround = find.byValueKey('final_coffee');
      final waterAmount = find.byValueKey('final_water');
      final doneButton = find.byValueKey('done_button');

      await driver.tap(dripMachine);
      await driver.tap(continueButton1);

      await driver.tap(cupInput);
      await driver.enterText('5');
      await driver.tap(continueButton2);

      expect(await driver.getText(coffeeGround), "50g - medium ground coffee.");
      expect(await driver.getText(waterAmount), "850g - water");

      await driver.tap(doneButton);
    });

    /*
      Given I am on the Coffee Device Selection Screen
      When I tap "Drip Machine"
      And I tap "Continue"
      And I enter "5"
      And I tap "Continue"
      And I tap the back button
      And I enter "6" 
      And I tap "Continue"
      Then I should see "50g - medium ground coffee"
      And I should see "850g - water"
    */
    test("should give recommendation for Drip Machine", () async {
      final dripMachine = find.byValueKey('drip');
      final continueButton1 = find.byValueKey('continue_button');
      final cupInput = find.byValueKey('coffee_num');
      final continueButton2 = find.byValueKey('continue_button2');
      final coffeeGround = find.byValueKey('final_coffee');
      final waterAmount = find.byValueKey('final_water');
      final doneButton = find.byValueKey('done_button');
      final backButton2 = find.byValueKey('back_button2');

      await driver.tap(dripMachine);
      await driver.tap(continueButton1);

      await driver.tap(cupInput);
      await driver.enterText('5');
      await driver.tap(continueButton2);

      expect(await driver.getText(coffeeGround), "50g - medium ground coffee.");
      expect(await driver.getText(waterAmount), "850g - water");

      await driver.tap(backButton2);

      await driver.tap(cupInput);
      await driver.enterText('6');
      await driver.tap(continueButton2);

      expect(await driver.getText(coffeeGround), "60g - medium ground coffee.");
      expect(await driver.getText(waterAmount), "1020g - water");

      await driver.tap(doneButton);
    });

    /*
      Given I am on the Coffee Device Selection Screen
      When I tap "French Press"
      And I tap "Continue"
      And I enter "5"
      And I tap "Continue"
      Then I should see "60g - course ground coffee"
      And I should see "850g - water"
      Then I tap "Done"
      Then I should be on the Choose Device screen
    */
    test("should give recommendation for French Press", () async {
      // your code here
      final deviceQ = find.byValueKey('device_question');
      final frenchPress = find.byValueKey('french_press');
      final continueButton1 = find.byValueKey('continue_button');
      final cupInput = find.byValueKey('coffee_num');
      final continueButton2 = find.byValueKey('continue_button2');
      final coffeeGround = find.byValueKey('final_coffee');
      final waterAmount = find.byValueKey('final_water');
      final doneButton = find.byValueKey('done_button');

      await driver.tap(frenchPress);
      await driver.tap(continueButton1);

      await driver.tap(cupInput);
      await driver.enterText('5');
      await driver.tap(continueButton2);

      expect(await driver.getText(coffeeGround), "60g - course ground coffee.");
      expect(await driver.getText(waterAmount), "850g - water");

      await driver.tap(doneButton);
      expect(await driver.getText(deviceQ), 'What coffee maker are you using?');
    });
  });

  group('Sad Paths', () {
    /*
      Given I am on the Coffee Device Selection Screen
      When I press "Continue"
      Then I expect to still be on the Coffee Device Selection Screen
    */
    test("should not advance from Choose Device Screen without a selection",
        () async {
      final question = find.byValueKey('device_question');
      final continueTap = find.byValueKey('continue_button');

      await driver.tap(continueTap);

      expect(
          await driver.getText(question), 'What coffee maker are you using?');
    });

    /*
      Given I chose "French Press" on the Coffee Device Selection Screen
      And I advanced to the Choose Cups Screen
      When I press "Continue"
      Then I expect to still be on the Choose Cups Screen
    */
    test("should not advance from Choose Cups Screen without cups (French)",
        () async {
      final frenchPress = find.byValueKey('french_press');
      final continueButton1 = find.byValueKey('continue_button');
      final cupQuestion = find.byValueKey('cup_question');
      final continueButton2 = find.byValueKey('continue_button2');
      final backB = find.byValueKey('back_button');
      await driver.tap(frenchPress);
      await driver.tap(continueButton1);

      await driver.tap(continueButton2);
      expect(
          await driver.getText(cupQuestion), 'How many cups would you like?');
      await driver.tap(backB);
    });

    /*
      Given I chose "French Press" on the Coffee Device Selection Screen
      And I advanced to the Choose Cups Screen
      When I enter "-1 ( or 0)"
      And I press "Continue"
      Then I expect to still be on the Choose Cups Screen
    */
    test(
        "should not advance from Choose Cups Screen with negative or 0 cup amount(French)",
        () async {
      final frenchPress = find.byValueKey('french_press');
      final continueButton = find.byValueKey('continue_button');
      final continueButton2 = find.byValueKey('continue_button2');
      final cupQuestion = find.byValueKey('cup_question');
      final cupNum = find.byValueKey('coffee_num');
      final backB = find.byValueKey('back_button');

      await driver.tap(frenchPress);
      await driver.tap(continueButton);

      await driver.tap(cupNum);
      await driver.enterText('0');
      await driver.tap(continueButton2);
      expect(
          await driver.getText(cupQuestion), "How many cups would you like?");
      await driver.tap(backB);
    });

    /*
      Given I chose "Drip Machine" on the Coffee Device Selection Screen
      And I advanced to the Choose Cups Screen
      When I press "Continue"
      Then I expect to still be on the Choose Cups Screen
    */
    test("should not advance from Choose Cups Screen without cups (Drip)",
        () async {
      await driver.clearTimeline();
      final dripMachine = find.byValueKey('drip');
      final continueButton1 = find.byValueKey('continue_button');
      final cupQuestion = find.byValueKey('cup_question');
      final continueButton2 = find.byValueKey('continue_button2');
      final backB = find.byValueKey('back_button');
      await driver.tap(dripMachine);
      await driver.tap(continueButton1);

      await driver.tap(continueButton2);

      expect(
          await driver.getText(cupQuestion), 'How many cups would you like?');
      await driver.tap(backB);
    });

    /*
      Given I chose "Drip Machine" on the Coffee Device Selection Screen
      And I advanced to the Choose Cups Screen
      When I enter "-1 (or 0)"
      And I press "Continue"
      Then I expect to still be on the Choose Cups Screen
    */
    test(
        "should not advance from Choose Cups Screen with negative or 0 cup amount(Drip)",
        () async {
      final dripMachine = find.byValueKey('drip');
      final continueButton = find.byValueKey('continue_button');
      final continueButton2 = find.byValueKey('continue_button2');
      final cupQuestion = find.byValueKey('cup_question');
      final cupNum = find.byValueKey('coffee_num');
      final backB = find.byValueKey('back_button');

      await driver.tap(dripMachine);
      await driver.tap(continueButton);

      await driver.tap(cupNum);
      await driver.enterText('0');
      await driver.tap(continueButton2);
      expect(
          await driver.getText(cupQuestion), "How many cups would you like?");
      await driver.tap(backB);
    });
  });
  group('Back Button', () {
    //make up your own tests to check that the back button works
    //on every page
    test(
        "When on the cup selection screen, and you click the back button, it should take you to choose device screen",
        () async {
      final dripMachine = find.byValueKey('drip');
      final continueButton = find.byValueKey('continue_button');
      final deviceQ = find.byValueKey('device_question');
      final backB = find.byValueKey('back_button');

      await driver.tap(dripMachine);
      await driver.tap(continueButton);

      await driver.tap(backB);

      expect(await driver.getText(deviceQ), 'What coffee maker are you using?');
    });

    test(
        'When on the final page(Result), and you press the back button, you should be able to go back to the cup selection screen',
        () async {
      final continueButton1 = find.byValueKey('continue_button');
      final continueButton2 = find.byValueKey('continue_button2');
      final dripMachine = find.byValueKey('drip');
      final cupNum = find.byValueKey('coffee_num');
      final cupQuestion = find.byValueKey('cup_question');
      final backButton2 = find.byValueKey('back_button2');

      await driver.tap(dripMachine);
      await driver.tap(continueButton1);

      await driver.tap(cupNum);
      await driver.enterText('5');
      await driver.tap(continueButton2);

      await driver.tap(backButton2);
      expect(
          await driver.getText(cupQuestion), 'How many cups would you like?');
    });
  });
}

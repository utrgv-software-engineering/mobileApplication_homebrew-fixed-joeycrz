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
      Then I should see "63g - course ground coffee"
      And I should see "887g - water"
    */
    test("should give recommendation for French Press", () async {
      // your code here
    });

    /*
      Given I am on the Coffee Device Selection Screen
      When I tap "Drip Machine"
      And I tap "Continue"
      And I enter "5"
      And I tap "Continue"
      Then I should see "52g - medium ground coffee"
      And I should see "887g - water"
    */
    test("should give recommendation for Drip Machine", () async {
      //your code here
    });
  }, skip: true);

  // group('Sad Paths', () {
  /*
      Given I am on the Coffee Device Selection Screen
      When I press "Continue"
      Then I expect to still be on the Coffee Device Selection Screen
    */
  test(
    "should not advance from Choose Device Screen without a selection",
    () async {
      await driver.clearTimeline();
      //your code here
      final question = find.byValueKey('device_question');
      final continueTap = find.byValueKey('continue_button');
      await driver.tap(continueTap);

      expect(
          await driver.getText(question), 'What coffee maker are you using?');
    },
    timeout: Timeout(
      Duration(seconds: 30),
    ),
  );

  /*
      Given I chose "French Press" on the Coffee Device Selection Screen
      And I advanced to the Choose Cups Screen
      When I press "Continue"
      Then I expect to still be on the Choose Cups Screen
    */
  test("should not advance from Choose Cups Screen without cups (French)",
      () async {
    await driver.clearTimeline();
    //your code here
    //final deviceQuestion = find.byValueKey('device_question');
    final frenchPress = find.byValueKey('french_press');
    final continueButton1 = find.byValueKey('continue_button');
    final cupQuestion = find.byValueKey('cup_question');
    final continueButton2 = find.byValueKey('continue_button2');
    final backB = find.byValueKey('back_button');
    await driver.tap(frenchPress);
    await driver.tap(continueButton1);

    await driver.tap(continueButton2);
    expect(await driver.getText(cupQuestion), 'How many cups would you like?');
    await driver.tap(backB);
  });

  /*
      Given I chose "French Press" on the Coffee Device Selection Screen
      And I advanced to the Choose Cups Screen
      When I enter "-1"
      And I press "Continue"
      Then I expect to still be on the Choose Cups Screen
    */
  test("should not advance from Choose Cups Screen with negative cup amount",
      () async {
    //your code here
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

    await driver.tap(dripMachine);
    await driver.tap(continueButton1);

    await driver.tap(continueButton2);

    expect(await driver.getText(cupQuestion), 'How many cups would you like?');
  }, timeout: Timeout.none);

  /*
      Given I chose "Drip Machine" on the Coffee Device Selection Screen
      And I advanced to the Choose Cups Screen
      When I enter "-1"
      And I press "Continue"
      Then I expect to still be on the Choose Cups Screen
    */
  test("should not advance from Choose Cups Screen with negative cup amount",
      () async {
    //your code here
  });

  group('Back Button', () {
    //make up your own tests to check that the back button works
    //on every page
    test(
        "When on the cup selection screen, and you click the back button, it should take you to choose device screen",
        () async {
      final backB = find.byValueKey('back_button');
      final deviceQ = find.byValueKey('device_question');

      await driver.tap(backB);
      expect(await driver.getText(deviceQ), 'What coffee maker are you using?');
    });
  });
}

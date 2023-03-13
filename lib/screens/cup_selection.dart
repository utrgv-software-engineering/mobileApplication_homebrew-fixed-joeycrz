import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:homebrew/screens/choose_device_screen.dart';
import 'package:homebrew/screens/coffee_result.dart';
import 'package:homebrew/utils/coffee_tools.dart';

class CupSelection extends StatefulWidget {
  @override
  String device = '';
  CupSelection({this.device});
  _CupSelectionState createState() => _CupSelectionState();
}

class _CupSelectionState extends State<CupSelection> {
  final textController = TextEditingController();
  bool button = false;
  int userInput = 0;

  @override
  void initState() {
    super.initState();
    textController.addListener(() {
      setState(() {
        button = textController.text.isNotEmpty;
      });
    });
  }

  bool _validateTextField(String value) {
    if (value.isEmpty) {
      return false;
    }
    int cups = int.tryParse(value);
    if (cups != null && cups > 0) {
      return true;
    }
    return false;
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              IconButton(
                  key: Key('back_button'),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChooseDeviceScreen()));
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Color(0xff4C748B),
                  )),
            ],
          ),
          SizedBox(
            height: 170,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "How many cups would you like?",
                key: Key('cup_question'),
                style: TextStyle(
                    color: Color(0xff4C748B),
                    fontFamily: 'Montserrat',
                    fontSize: 18,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 3, color: Color(0xff4C748B))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 337,
                  height: 48,
                  child: TextField(
                    key: Key('coffee_num'),
                    controller: textController,
                    decoration:
                        InputDecoration(contentPadding: EdgeInsets.all(15)),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    onChanged: (value) {
                      button = _validateTextField(value);
                      userInput = int.parse(value);
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          ElevatedButton(
            key: Key('continue_button2'),
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                minimumSize: Size(280, 45),
                primary: Color(0xff4C748B)),
            onPressed: button
                ? () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CoffeeResult(
                                  device: widget.device,
                                  userInput: userInput,
                                )));
                  }
                : null,
            child: Text(
              'Continue',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ]));
  }
}

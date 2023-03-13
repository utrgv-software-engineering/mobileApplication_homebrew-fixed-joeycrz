import 'package:flutter/material.dart';
import 'package:homebrew/screens/cup_selection.dart';
import 'package:homebrew/utils/coffee_tools.dart';

class ChooseDeviceScreen extends StatefulWidget {
  @override
  _ChooseDeviceScreenState createState() => _ChooseDeviceScreenState();
}

class _ChooseDeviceScreenState extends State<ChooseDeviceScreen> {
  bool def = true;
  bool check = true;
  int select = -1;
  String device = '';

  void _onInkWellTapped(int index) {
    setState(() {
      select = index;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text("Cool Appbar"),
        // ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "What coffee maker are you using?",
                key: Key('device_question'),
                style: TextStyle(
                    color: Color(0xff4C748B),
                    fontFamily: 'Montserrat',
                    fontSize: 18,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 3, color: Color(0xff4C748B))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                    key: Key('french_press'),
                    onTap: () {
                      _onInkWellTapped(0);
                      check = false;
                      device = 'French Press';
                    },
                    child: Container(
                        //color: Color(0xfF3F3F3),
                        width: 337,
                        height: 48,
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 1, color: Color(0xff4C748B))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              'French Press',
                              style: TextStyle(
                                  color: Color(0xff4C748B),
                                  fontFamily: 'Montserrat',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              width: 190,
                            ),
                            Icon(
                              Icons.check,
                              color: (select == 0
                                  ? Color(0xff4C748B)
                                  : Colors.white),
                            ),
                          ],
                        ))),
                InkWell(
                    key: Key('drip'),
                    onTap: () {
                      _onInkWellTapped(1);
                      def = false;
                      device = 'Drip Machine';
                    },
                    child: Container(
                        color: Color(0xfF3F3F3),
                        width: 337,
                        height: 48,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              'Drip Machine',
                              style: TextStyle(
                                  color: Color(0xff4C748B),
                                  fontFamily: 'Montserrat',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              width: 190,
                            ),
                            Icon(
                              Icons.check,
                              color: (select == 1
                                  ? Color(0xff4C748B)
                                  : Colors.white),
                            ),
                          ],
                        ))),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                minimumSize: Size(280, 46),
                primary: Color(0xff4C748B)),
            key: Key('continue_button'),
            onPressed: def && check
                ? null
                : () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CupSelection(
                                  device: device,
                                )));
                  },
            child: Text(
              'Continue',
              key: Key('continue_button_text'),
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ]));
  }
}

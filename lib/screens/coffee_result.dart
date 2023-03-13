import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:homebrew/screens/choose_device_screen.dart';
import 'package:homebrew/screens/cup_selection.dart';
import 'package:homebrew/utils/coffee_tools.dart';

class CoffeeResult extends StatefulWidget {
  String device = '';
  int userInput = 0;
  CoffeeResult({this.device, this.userInput});
  @override
  _CoffeeResultState createState() => _CoffeeResultState();
}

class _CoffeeResultState extends State<CoffeeResult> {
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
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CupSelection(
                                  device: widget.device,
                                )));
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    key: Key('back_button2'),
                    color: Color(0xff4C748B),
                  )),
            ],
          ),
          SizedBox(
            height: 150,
          ),
          Container(
            width: 337,
            height: 164,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 3, color: Color(0xff4C748B))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 8,
                ),
                Text('Recommended',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Kollektif',
                      fontWeight: FontWeight.normal,
                      color: Color(0xff4C748B),
                    )),
                SizedBox(
                  height: 8,
                ),
                Container(
                  width: 293,
                  height: 3,
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: const Color(0xaff4C748B),
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                    '${widget.device == 'French Press' ? '${CoffeeTools.calculationToFrench(widget.userInput)}' + 'g - course ground coffee.' : '${CoffeeTools.calculationToDrip(widget.userInput)}' + 'g - medium ground coffee.'}',
                    key: Key('final_coffee'),
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Kollektif',
                      fontWeight: FontWeight.normal,
                      color: Color(0xff4C748B),
                    )),
                Text(
                    '${CoffeeTools.cupsToGrams(widget.userInput)}' +
                        'g - water',
                    key: Key('final_water'),
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Kollektif',
                      fontWeight: FontWeight.normal,
                      color: Color(0xff4C748B),
                    )),
                SizedBox(
                  height: 35,
                ),
                Text('Enjoy your delicous coffee.',
                    style: TextStyle(
                      fontSize: 10,
                      fontFamily: 'Kollektif',
                      fontWeight: FontWeight.normal,
                      color: Color(0xff4C748B),
                    )),
              ],
            ),
          ),
          SizedBox(
            height: 170,
          ),
          ElevatedButton(
            key: Key('done_button'),
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minimumSize: Size(280, 46),
                primary: Color(0xff4C748B)),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ChooseDeviceScreen()));
            },
            child: Text(
              'Done',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ]));
  }
}

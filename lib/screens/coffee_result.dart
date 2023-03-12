import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:homebrew/screens/cup_selection.dart';

class CoffeeResult extends StatefulWidget {
  @override
  _CoffeeResultState createState() => _CoffeeResultState();
}

class _CoffeeResultState extends State<CoffeeResult> {
  final textController = TextEditingController();
  bool button = false;

  void initState() {
    super.initState();
    textController.addListener(() {
      setState(() {
        button = textController.text.isNotEmpty;
      });
    });
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
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CupSelection()));
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
                    controller: textController,
                    decoration:
                        InputDecoration(contentPadding: EdgeInsets.all(15)),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    onChanged: (value) {},
                  ),
                ),
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
                minimumSize: Size(280, 45),
                primary: Color(0xff4C748B)),
            onPressed: button ? () {} : null,
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

import 'package:flutter/material.dart';

class CupSelection extends StatefulWidget {
  @override
  _CupSelectionState createState() => _CupSelectionState();
}

class _CupSelectionState extends State<CupSelection> {
  @override
  bool def = false;
  bool check = false;
  bool _agreed = false;
  String keys = 'test';
  int select = -1;

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
                "You are a loser",
                key: Key('cup_selection'),
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
                    onTap: () {
                      _onInkWellTapped(0);
                      check = true;
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
                              width: 200,
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
                    onTap: () {
                      _onInkWellTapped(1);
                      def = true;
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
                              width: 200,
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
            onPressed: def || check ? () {} : null,
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

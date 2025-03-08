import 'package:app/card.dart';
import 'package:app/states.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  _App createState() => _App();
}

class _App extends State<HomeScreen> {
  late List<int> list = [];
  late int cvv;
  late String month;
  late String year;
  late String total;
  late DateTime randomDate;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (int i = 0; i < 4; i++) {
      list.add(Faker().randomGenerator.integer(9999, min: 1000));
    }
    cvv = Faker().randomGenerator.integer(999, min: 100);
    randomDate = Faker().date.dateTimeBetween(
          DateTime(2020, 1, 1), // Start date
          DateTime(2030, 12, 31), // End date
        );
    month = randomDate.month.toString().padLeft(2, '0');
    year = randomDate.year.toString().substring(2);
    total = "$month/$year";
  }

  @override
  Widget build(BuildContext context) {
    print("bharat");
    return Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: SafeArea(
              child: Padding(
            padding: EdgeInsets.only(left: 20, top: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "select payment mode",
                  style: TextStyle(
                      fontSize: 27,
                      color: Colors.white,
                      fontWeight: FontWeight.w900),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "choose your preferred payment method to make payment.",
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                ),
                SizedBox(
                  height: 14,
                ),
                Row(
                  children: [
                    Container(
                        width: 96,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border(
                              top: BorderSide(color: Colors.white, width: 2),
                              left: BorderSide(color: Colors.white, width: .2),
                              right:
                                  BorderSide(color: Colors.white, width: .2)),
                        ),
                        child: Center(
                          child: Text(
                            "pay",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                        )),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                        height: 40,
                        width: 96,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border(
                              top: BorderSide(color: Colors.red, width: 2),
                              left: BorderSide(color: Colors.red, width: .2),
                              right: BorderSide(color: Colors.red, width: .2)),
                        ),
                        child: Center(
                          child: Text(
                            "card",
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                        )),
                  ],
                ),
                SizedBox(
                  height: 35,
                ),
                Text(
                  "YOUR DIGITAL DEBIT CARD",
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Consumer(builder: (context, ref, _) {
                      return (ref.watch(isFrozen)
                          ? unFreezeCard()
                          : FreezeCard(
                              list: list,
                              cvv: cvv,
                              date: total,
                            ));
                    }),
                    SizedBox(
                      width: 13,
                    ),
                    Consumer(builder: (context, ref, _) {
                      return GestureDetector(
                          onTap: () {
                            ref.read(isFrozen.notifier).state =
                                !ref.watch(isFrozen);
                            ref.read(eye.notifier).state = false;
                          },
                          child: Padding(
                            padding: EdgeInsets.only(top: 79),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: (ref.watch(isFrozen)
                                          ? Border.all(color: Colors.red)
                                          : Border(
                                              top: BorderSide(
                                                  color: Colors.white),
                                              left: BorderSide(
                                                  color: Colors.white),
                                              right: BorderSide(
                                                  color: Colors.white)))),
                                  child: FaIcon(
                                    FontAwesomeIcons.snowflake,
                                    color: (ref.watch(isFrozen)
                                        ? Colors.red
                                        : Colors.white),
                                  ),
                                ),
                                Text(
                                  (ref.watch(isFrozen) ? "unfreeze" : "freeze"),
                                  style: TextStyle(
                                      color: (ref.watch(isFrozen)
                                          ? Colors.red
                                          : Colors.white)),
                                )
                              ],
                            ),
                          ));
                    })
                  ],
                ),
                SizedBox(
                  height: 15,
                )
              ],
            ),
          )),
        ),
        bottomNavigationBar: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 108,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.elliptical(200, 60),
                      topRight: Radius.elliptical(200, 60)),
                  border:
                      Border(top: BorderSide(color: Colors.white, width: 2))),
            ),
            Positioned(
              left: 0,
              right: 0,
              //bottom: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border(
                                top: BorderSide(color: Colors.grey, width: .8),
                                left: BorderSide(color: Colors.grey, width: .5),
                                right:
                                    BorderSide(color: Colors.grey, width: .5))),
                        child: Icon(
                          Icons.home_outlined,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        "home",
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(7),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border(
                                top: BorderSide(
                                  color: Colors.white,
                                  width: 2,
                                ),
                                left: BorderSide(
                                  color: Colors.white,
                                ),
                                right: BorderSide(
                                  color: Colors.white,
                                ))),
                        child: Icon(
                          Icons.qr_code_scanner_rounded,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "yolo pay",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border(
                                top: BorderSide(color: Colors.grey, width: .8),
                                left: BorderSide(color: Colors.grey, width: .5),
                                right:
                                    BorderSide(color: Colors.grey, width: .5))),
                        child: Icon(
                          Icons.settings_outlined,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        "ginie",
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }
}

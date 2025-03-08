import 'dart:async';

import 'package:app/states.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:snow_fall_animation/snow_fall_animation.dart';

/*class FreezeCard extends StatefulWidget {
  
  _freeze createState() => _freeze();
}*/

class FreezeCard extends ConsumerWidget {
  List<int> list = [];
  final int cvv;
  final String date;
  FreezeCard(
      {required this.list, required this.cvv, required this.date, super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(left: 20, top: 10, bottom: 10, right: 8),
          height: 296,
          width: 186,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5,
                  spreadRadius: 2,
                  blurStyle: BlurStyle.solid)
            ], /*border: Border.all(color: Colors.grey, width: 2)*/
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "assets/yolo.png",
                    height: 20,
                    width: 50,
                    fit: BoxFit.contain,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        "assets/yesbank.png",
                        height: 20,
                        width: 50,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(
                        width: 15,
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 23,
              ),
              Row(
                children: [
                  Column(
                    children: list.map((e) {
                      return Text(
                        e.toString(),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "expiry       ",
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text(
                            date,
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 17,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "cvv           ",
                            style: TextStyle(color: Colors.grey),
                          ),
                          Consumer(builder: (context, ref, _) {
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                (ref.watch(eye)
                                    ? Text(
                                        cvv.toString(),
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 17),
                                      )
                                    : Text(
                                        "***",
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 17),
                                      )),
                                SizedBox(
                                  width: 4,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    ref.read(eye.notifier).state =
                                        !ref.watch(eye);
                                  },
                                  child: FaIcon(
                                    (ref.watch(eye)
                                        ? FontAwesomeIcons.eye
                                        : FontAwesomeIcons.eyeSlash),
                                    color: Colors.red,
                                    size: 20,
                                  ),
                                )
                              ],
                            );
                          })
                        ],
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 23,
              ),
              Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.copy,
                    color: Colors.red,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "copy details",
                    style: TextStyle(color: Colors.red, fontSize: 18),
                  )
                ],
              ),
              SizedBox(
                height: 18,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [Image.asset("assets/rupaylogo.png")],
              )
            ],
          ),
        ),
        (ref.watch(visibility)
            ? Consumer(builder: (context, ref, _) {
                Timer(Duration(seconds: 15), () {
                  ref.read(visibility.notifier).state = false;
                });
                return SizedBox(
                  height: 296,
                  width: 186,
                  child: SnowFallAnimation(
                    config: SnowfallConfig(
                      numberOfSnowflakes: 500,
                      accumulationDuration: Duration(seconds: 2),
                      speed: 8.0,
                      useEmoji: true,
                      customEmojis: ['❄️', '❅', '❆'],
                    ),
                  ),
                );
              })
            : Visibility(
                visible: false,
                child: SizedBox(
                  height: 296,
                  width: 186,
                )))
      ],
    );
  }
}

Widget unFreezeCard() {
  return Container(
    height: 296,
    width: 186,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
              color: Colors.grey,
              blurRadius: 5,
              spreadRadius: 2,
              blurStyle: BlurStyle.solid)
        ],
        image: DecorationImage(image: AssetImage("assets/cardImage.png"))
        /*border: Border.all(color: Colors.grey, width: 2)*/
        ),
  );
}

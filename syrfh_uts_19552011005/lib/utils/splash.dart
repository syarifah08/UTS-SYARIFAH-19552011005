import 'package:flutter/material.dart';
import 'dart:async';
import 'package:syrfh_uts_19552011005/modules/items/item_page.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 4),
            () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => ItemPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Stack(children: [
          Center(
            child: Container(
                color: Colors.white,
                child: Container(
                  child: Image.asset(
                    'assets/images/fujifilm.png',
                    width: 300,
                  ),
                )),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 10),
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: "Made With ",
                          style: TextStyle(color: Colors.black, fontSize: 15)),
                      WidgetSpan(
                          child: Icon(
                            Icons.favorite,
                            size: 18,
                            color: Colors.pink,
                          )),
                      TextSpan(
                          text: " | © 2021 ",
                          style: TextStyle(fontSize: 15, color: Colors.black))
                    ]))
              ],
            ),
          )
        ]),
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mizala_test/screen/photoList_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  startTimeOut() {
    return Timer(Duration(seconds: 3), () async {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
        return PhotosListScreen();
      }));
    });
  }

  @override
  void initState() {
    startTimeOut();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SvgPicture.asset(
                "images/splash.svg",
                height: 100,
                width: 100,
              ),
            ),
          )),
    );
  }
}

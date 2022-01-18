 import 'dart:async';

import 'package:flutter/material.dart';
import 'package:redux_aws/login.dart';

import 'home.dart';
import 'main.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
//
// class Loading extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.white,
//       child: Center(
//         child: SpinKitChasingDots(
//
//           color: Colors.redAccent,
//           size: 50.0,
//           duration: Duration(milliseconds: 2000),
//         ),
//       ),
//     );
//   }
// }
 class Loading extends StatefulWidget {
   @override
   _MyHomePageState createState() => _MyHomePageState();
 }
class _MyHomePageState extends State<Loading> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                jain ? Home() : Login()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child:FlutterLogo(size:MediaQuery.of(context).size.height)
    );
  }
}
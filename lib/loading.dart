import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Redux",
                        style: TextStyle(
                          fontSize: 50,
                        )),
                    Text("AWS",
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 50,
                        ))
                  ],
                ),
              ),
              Center(
                child: SpinKitChasingDots(
                  color: Colors.redAccent,
                  size: 50.0,
                  duration: Duration(milliseconds: 2000),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_aws/home.dart';
import 'package:redux_aws/redux/store.dart';
import 'login.dart';
import 'redux/ex.dart';import 'dart:ui' as ui;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
    Widget build(BuildContext context) {
      return MaterialApp(
        title: "hey there",
        home: Scaffold(
          appBar: AppBar(
            flexibleSpace: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.blue,
                    Colors.purple,
                  ],
                ),
              ),
              alignment: Alignment.bottomCenter,
              child: Text(
                "Hey! There",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
          body: Center(
            child: OutlinedButton(
              onPressed: () {
                logout();
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => Login()));
              },
              child: Text(
                'Submit..',
                style: TextStyle(
                    fontSize: 30,
                    foreground: Paint()
                      ..shader = ui.Gradient.linear(
                        const Offset(0, 0),
                        const Offset(400, 0),
                        <Color>[
                          Colors.white,
                          Colors.white,
                        ],
                      )),
              ),
            ),
          ),
          drawer: Drawer(
            child: Center(child: Text('drawer')),
          ),
        ),
      );
    }
    Future<void> logout() async {
      try {
        await Amplify.Auth.signOut();
      } on AuthException catch (e) {
        print(e.message);
      }
    }

}


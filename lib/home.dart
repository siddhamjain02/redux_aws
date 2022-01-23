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
        debugShowCheckedModeBanner: false,
        title: "hey there",

        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
            foregroundColor: Colors.red,
          ),
           body: Center(child: ElevatedButton(
             style: ElevatedButton.styleFrom(
               shape: const RoundedRectangleBorder(
                   borderRadius: BorderRadius.all(Radius.circular(33))),
               primary: Colors.white,
               side: BorderSide(color: Colors.black, width: 2),
             ),
             onPressed: () {logout();
               // StoreProvider.of<AppState>(context).dispatch(LogAction(
               //     emailController.text, passwordController.text));
               // Navigator.push(
               //     context, MaterialPageRoute(builder: (_) => Home()));
             },
             child: Text('LOGOUT',
                 style: TextStyle(
                   color: Colors.red,
                   fontSize: 40,
                 )),
           ),

          //   child: OutlinedButton(
          //     onPressed: () {
          //       logout();
          //       Navigator.push(
          //           context, MaterialPageRoute(builder: (_) => Login()));
          //     },
          //     child: Text(
          //       'Submit..',
          //       style: TextStyle(
          //           fontSize: 30,*-+
          //           foreground: Paint()
          //             ..shader = ui.Gradient.linear(
          //               const Offset(0, 0),
          //               const Offset(400, 0),
          //               <Color>[
          //                 Colors.white,
          //                 Colors.white,
          //               ],
          //             )),
          //     ),
          //   ),
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
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => Login()));
      } on AuthException catch (e) {
        print(e.message);
      }
    }

}


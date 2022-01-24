import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_aws/home.dart';
import 'package:redux_aws/redux/ex.dart';

import 'login.dart';
import 'redux/store.dart';

TextEditingController confirmationCodeController = TextEditingController();

class Confirmation extends StatefulWidget {
  const Confirmation({Key? key}) : super(key: key);

  @override
  _ConfirmationState createState() => _ConfirmationState();
}

class _ConfirmationState extends State<Confirmation> {
  @override
  Widget build(BuildContext context) {
    void _confirmSignUp() async {
      try {
        SignUpResult res = await Amplify.Auth.confirmSignUp(
            username: email, confirmationCode: confirmationCodeController.text);
        if (res.isSignUpComplete = true) {
          // setState(() {
          //   loading = false;
          // });
          Navigator.pop(context);
        }
      } on AuthException catch (e) {
        print(e.message);
      }
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.red,
          scaffoldBackgroundColor: const Color(0xFFEFEFEF)),
      home: Scaffold(
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            alignment: Alignment.topCenter,
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
          Container(
            padding: EdgeInsets.all(5),
            child: TextField(
              controller: confirmationCodeController,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(33),
                    borderSide: BorderSide(color: Colors.red, width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(33),
                    borderSide: BorderSide(color: Colors.black, width: 2.0),
                  ),
                  labelStyle: TextStyle(color: Colors.red),
                  labelText: 'Confirmation Code'),
            ),
          ),
          StoreConnector<AppState, AppState>(
            converter: (store) => store.state,
            builder: (context, state) {
              return Container(
                padding: EdgeInsets.all(40),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(33))),
                    primary: Colors.white,
                    side: BorderSide(color: Colors.black, width: 2),
                  ),
                  onPressed: () {
                    _confirmSignUp();
                  },
                  child: Text('Submit',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 40,
                      )),
                ),
              );
            },
          ),
        ]),
      ),
    );
  }
}

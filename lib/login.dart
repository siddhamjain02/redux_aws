import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_aws/confirmation.dart';
import 'package:redux_aws/home.dart';
import 'package:redux_aws/redux/ex.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';

import 'loading.dart';
import 'redux/store.dart';

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

String email = emailController.text;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    void _login() async {
      try {
        StoreProvider.of<AppState>(context).dispatch(
          LoadingAction(true),
        );
        SignInResult res = await Amplify.Auth.signIn(
          username: emailController.text,
          password: passwordController.text,
        );
        if (res.isSignedIn = true) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => Home()));
          StoreProvider.of<AppState>(context).dispatch(
            LoadingAction(false),
          );
        }
      } catch (e) {
        StoreProvider.of<AppState>(context).dispatch(
          LoadingAction(false),
        );
        final snackBar = SnackBar(
          content: const Text("Try again"),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }

    void _registerAccount() async {
      try {
        StoreProvider.of<AppState>(context).dispatch(
          LoadingAction(true),
        );
        SignUpResult res = await Amplify.Auth.signUp(
          username: emailController.text,
          password: passwordController.text,
          options: CognitoSignUpOptions(
            userAttributes: {"email": emailController.text},
          ),
        );
        if (res.isSignUpComplete = true) {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => Confirmation()));
          StoreProvider.of<AppState>(context).dispatch(
            LoadingAction(false),
          );
        }
      } catch (e) {
        StoreProvider.of<AppState>(context).dispatch(
          LoadingAction(false),
        );
        final snackBar = SnackBar(
          content: const Text("Try again"),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }

    return StoreConnector<AppState, AppState>(
      converter: (Store<dynamic> store) => store.state,
      builder: (BuildContext context, state) {
        return StoreProvider.of<AppState>(context).state.loadingstate
            ? Loading()
            : MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                    primaryColor: Colors.red,
                    scaffoldBackgroundColor: const Color(0xFFEFEFEF)),
                home: Scaffold(
                  resizeToAvoidBottomInset: false,
                  body: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(40),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
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
                              controller: emailController,
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(33),
                                    borderSide: BorderSide(
                                        color: Colors.red, width: 2.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(33),
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 2.0),
                                  ),
                                  labelStyle: TextStyle(color: Colors.red),
                                  labelText: 'Login ID'),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            child: TextField(
                              obscureText: true,
                              controller: passwordController,
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(33),
                                    borderSide: BorderSide(
                                        color: Colors.red, width: 2.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(33),
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 2.0),
                                  ),
                                  labelStyle: TextStyle(color: Colors.red),
                                  labelText: 'Password'),
                            ),
                          ),
                          StoreConnector<AppState, AppState>(
                            converter: (store) => store.state,
                            builder: (context, state) {
                              return Container(
                                padding: EdgeInsets.all(10),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(33))),
                                    primary: Colors.white,
                                    side: BorderSide(
                                        color: Colors.black, width: 2),
                                  ),
                                  onPressed: () {
                                    _login();
                                    emailController.clear();
                                    passwordController.clear();
                                    // StoreProvider.of<AppState>(context).dispatch(LogAction(
                                    //     emailController.text, passwordController.text));
                                    // Navigator.push(
                                    //     context, MaterialPageRoute(builder: (_) => Home()));
                                  },
                                  child: Text('SUBMIT',
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 40,
                                      )),
                                ),
                              );
                            },
                          ),
                          Text("or"),
                          StoreConnector<AppState, AppState>(
                            converter: (store) => store.state,
                            builder: (context, state) {
                              return SingleChildScrollView(
                                child: Container(
                                  alignment: Alignment.bottomCenter,
                                  padding: EdgeInsets.all(10),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(33))),
                                      primary: Colors.white,
                                      side: BorderSide(
                                          color: Colors.black, width: 2),
                                    ),
                                    onPressed: () {
                                      _registerAccount();
                                      // StoreProvider.of<AppState>(context).dispatch(LogAction(
                                      //     emailController.text, passwordController.text));
                                      // Navigator.push(
                                      //     context, MaterialPageRoute(builder: (_) => Confirmation()));
                                    },
                                    child: Text('SIGNUP',
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 40,
                                        )),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
      },
    );
  }
}

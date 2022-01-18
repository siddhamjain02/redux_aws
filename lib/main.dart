import 'dart:async';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_aws/confirmation.dart';
import 'package:redux_aws/home.dart';
import 'amplifyconfiguration.dart';
import 'redux/ex.dart';
import 'login.dart';
void main() {
  Store<AppState> _store =
  Store<AppState>(reducer, initialState: AppState.initialState(),);
  runApp(StoreProvider(store: _store,
  child: App1()));
}

class App1 extends StatefulWidget {
  const App1({Key? key}) : super(key: key);

  @override
  _App1State createState() => _App1State();
}


class _App1State extends State<App1> {
  @override

  bool _amplifyConfigured = false;
  void initState() {
    super.initState();
    _configureAmplify();
  }

  Future<void> _configureAmplify() async {
    await Amplify.addPlugins([AmplifyAuthCognito()]);
    await Amplify.configure(amplifyconfig);
    setState(() {
      _amplifyConfigured = true;
    });
  }
  bool jain = false;
  Future<bool> _isSignedIn() async {
    final session = await Amplify.Auth.fetchAuthSession();
    return session.isSignedIn;
  }
  Future<void> isSignedIn() async {
    jain = await _isSignedIn();
    print("*******************$jain*****************");
  }


  Widget build(BuildContext context) {
    isSignedIn();
    return MaterialApp(
        home: Scaffold(
          body:jain ? Home() : Login()
        ));
  }
}

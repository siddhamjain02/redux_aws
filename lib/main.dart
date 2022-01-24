import 'dart:async';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_aws/home.dart';
import 'package:redux_aws/loading.dart';
import 'package:redux_aws/login.dart';
import 'amplifyconfiguration.dart';
import 'redux/store.dart';

// cd /home/siddham/Downloads/platform-tools_r31.0.3-linux/platform-tools
// ./adb pair 192.168.1.35:38805
// ./adb connect 192.168.1.35:38805

void main() {
  final Store<AppState> _store = Store<AppState>(
    reducer,
    initialState: AppState.initialState(),
  );
  runApp(StoreProvider(store: _store, child: App1()));
}

bool logstate = false;

bool amplifyConfigured = false;

class App1 extends StatefulWidget {
  const App1({Key? key}) : super(key: key);

  @override
  _App1State createState() => _App1State();
}

class _App1State extends State<App1> {
  Future<void> _configureAmplify() async {
    await Amplify.addPlugins([AmplifyAuthCognito()]);
    await Amplify.configure(amplifyconfig);
    final session = await Amplify.Auth.fetchAuthSession();
    logstate = session.isSignedIn;
    setState(() {
      amplifyConfigured = true;
    });
  }

  void initState() {
    super.initState();
    _configureAmplify();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: StoreConnector<AppState, AppState>(
          converter: (Store<dynamic> store) => store.state,
          builder: (BuildContext context, state) {
            StoreProvider.of<AppState>(context).dispatch(
              InitAction(amplifyConfigured),
            );
            StoreProvider.of<AppState>(context).dispatch(
              LogAction(logstate),
            );
            // print(StoreProvider.of<AppState>(context).state.initialstate);
            // print("********************");
            // print(StoreProvider.of<AppState>(context).state.loginstate);
            // print("**************************************************");

            return Scaffold(
                body: StoreProvider.of<AppState>(context).state.initialstate
                    ? StoreProvider.of<AppState>(context).state.loginstate
                        ? Home()
                        : Login()
                    : Loading());
          },
        ));
  }
}

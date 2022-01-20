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
import 'redux/ex.dart';

void main() {
  Store<AppState> _store =
  Store<AppState>(reducer, initialState: AppState.initialState(),);
  runApp(StoreProvider(store: _store,
  child: App1()));
}
bool jain = false;

bool amplifyConfigured = false;
class App1 extends StatefulWidget {
  const App1({Key? key}) : super(key: key);

  @override
  _App1State createState() => _App1State();
}


class _App1State extends State<App1> {
  @override


  Future<void> _configureAmplify() async {
    await Amplify.addPlugins([AmplifyAuthCognito()]);
    await Amplify.configure(amplifyconfig);
    final session = await Amplify.Auth.fetchAuthSession();
    jain = session.isSignedIn;
    print("*******************jain=$jain*****************");
    setState(() {
      amplifyConfigured = true;
    });
    print("*******************ampc=$amplifyConfigured*****************");
  }

  void initState() {
    super.initState();
    _configureAmplify();

  }

  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Scaffold(
           body:amplifyConfigured?jain ? Home(): Login() :Loading()
        ));
  }
}

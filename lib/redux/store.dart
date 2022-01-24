import 'dart:convert';
import 'package:meta/meta.dart';

//AppState

@immutable
class AppState {
  final bool initialstate;
  final bool loginstate;
  final bool loadingstate;

  const AppState({
    this.initialstate = false,
    this.loginstate = false,
    this.loadingstate = false,
  });
  AppState.initialState()
      : initialstate = false,
        loginstate = false,
        loadingstate = false;
  AppState copyWith(
      {bool initialstate = false,
      bool loginstate = false,
      bool loadingstate = false}) {
    return AppState(
      initialstate: initialstate,
      loginstate: loginstate,
      loadingstate: loadingstate,
    );
  }
}

//Action

class LogAction {
  final bool _payload;
  bool get payload => _payload;
  LogAction(this._payload);
}

class InitAction {
  final bool _payload;
  bool get payload => _payload;
  InitAction(this._payload);
}

class LoadingAction {
  final bool _payload;
  bool get payload => _payload;
  LoadingAction(this._payload);
}

//reducer

AppState reducer(AppState prev, dynamic action) {
  if (action is LogAction) {
    return prev.copyWith(loginstate: action.payload,initialstate: prev.initialstate,loadingstate: prev.loadingstate);
  } else if (action is InitAction) {
    return prev.copyWith(loginstate: prev.loginstate,initialstate: action.payload,loadingstate: prev.loadingstate);
  } else if (action is LoadingAction) {
    return prev.copyWith(loginstate: prev.loginstate,initialstate: prev.initialstate,loadingstate: action.payload);
  } else {
    return prev;
  }
}

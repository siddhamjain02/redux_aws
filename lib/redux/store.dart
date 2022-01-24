import 'dart:convert';
import 'package:meta/meta.dart';



@immutable
class AppState {
  final bool? initialstate;
  final bool? loginstate;
  final bool? loadingstate;

  const AppState({
    this.initialstate,
    this.loginstate,
    this.loadingstate,
  });

  AppState copyWith({bool? initialstate, bool? loginstate, bool? loadingstate}) {
    return AppState(
      initialstate: initialstate ?? this.initialstate,
      loginstate: loginstate ?? this.loginstate,
      loadingstate: loadingstate ?? this.loadingstate,
    );
  }
  AppState.initialState() : initialstate = false, loginstate = false, loadingstate = false;
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
    return prev.copyWith(initialstate: true);
  } else {
    return prev;
  }
}
import 'package:equatable/equatable.dart';

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
      {bool? initialstate, bool? loginstate, bool? loadingstate}) {
    return AppState(
      initialstate: initialstate ?? this.initialstate,
      loginstate: loginstate ?? this.loginstate,
      loadingstate: loadingstate ?? this.loadingstate,
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
    return prev.copyWith(
      loginstate: action.payload,
    );
  } else if (action is InitAction) {
    return prev.copyWith(
      initialstate: action.payload,
    );
  } else if (action is LoadingAction) {
    return prev.copyWith(loadingstate: action.payload);
  } else {
    return prev;
  }
}

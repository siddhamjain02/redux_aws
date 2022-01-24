class AppState {
  final String _user;
  final String _pass;

  String get user => _user;
  String get pass => _pass;

   AppState copyWith({
  String? user
}){
     return AppState{
       this._user; this._pass;
     }

}

  AppState.initialState() : _user = "", _pass = "";

}
class LogAction {
  final String _user;
  final String _pass;

  String get user => _user;
  String get pass => _pass;

  LogAction(this._user, this._pass);
}
AppState reducer(AppState prev, dynamic action) {
  if (action is LogAction) {
    return AppState(action.user, action.pass);
  } else {
    return prev;
  }
}
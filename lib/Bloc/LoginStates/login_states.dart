abstract class LoginStates {}

class InitLoginStates extends LoginStates {}

class LoginSuccessStates extends LoginStates {
  String uId;
  LoginSuccessStates({required this.uId});
}

class LoginErrorStates extends LoginStates {
  final String error;
  LoginErrorStates({required this.error});
}

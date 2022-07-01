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

class LoginFilterUser extends LoginStates {
  String uId;
  LoginFilterUser({required this.uId});
}

class LoginFilterPharmacy extends LoginStates {
  String uId;
  LoginFilterPharmacy({required this.uId});
}

class LoginFilterError extends LoginStates {
  String error;
  LoginFilterError({required this.error});
}

class LoadingLoginStates extends LoginStates {}

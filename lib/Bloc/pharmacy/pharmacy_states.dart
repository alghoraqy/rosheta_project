abstract class PharmacyStates {}

class PharmacyInitialStates extends PharmacyStates {}

class PharmacyChangeBotNavStates extends PharmacyStates {}

class PharmacyRadioCheckState extends PharmacyStates {}

// class GetAllDrugsSuccess extends PharmacyStates {}

// class GetAllDrugsLoading extends PharmacyStates {}

// class GetAllDrugsError extends PharmacyStates {
//   final String error;
//   GetAllDrugsError(this.error);
// }

class GetPharmacyDataSuccess extends PharmacyStates {}

class GetPharmacyDataLoading extends PharmacyStates {}

class GetPharmacyDataError extends PharmacyStates {
  final String error;
  GetPharmacyDataError(this.error);
}

// class PutDrugsLoading extends PharmacyStates {}

// class PutDrugsSuccess extends PharmacyStates {}

// class PutDrugsError extends PharmacyStates {}

class GetMyDrugsLoading extends PharmacyStates {}

class GetMyDrugsSuccess extends PharmacyStates {}

class GetMyDrugsError extends PharmacyStates {
  final String error;
  GetMyDrugsError(this.error);
}
class GetAllPharmaciesLoading extends PharmacyStates {}

class GetAllPharmaciesSuccess extends PharmacyStates {}
class GetDistanceSuccess extends PharmacyStates {}

class GetAllPharmaciesError extends PharmacyStates {
  final String error;
  GetAllPharmaciesError(this.error);
}

class UpdateDrugsLoading extends PharmacyStates {}

class UpdateDrugsSuccess extends PharmacyStates {}

class UpdateDrugsError extends PharmacyStates {
  final String error;
  UpdateDrugsError(this.error);
}



class PutuIdLoading extends PharmacyStates {}

class PutuIdSuccess extends PharmacyStates {}

class PutuIdErrror extends PharmacyStates {
  final String error;
  PutuIdErrror(this.error);
}

class IncreaseUpdate extends PharmacyStates {}

class DecreaseUpdate extends PharmacyStates {}

class UpdatePharmacyDataSuccess extends PharmacyStates {}

class UpdatePharmacyDataError extends PharmacyStates {}

class SignOutSuccessPharmacy extends PharmacyStates {}

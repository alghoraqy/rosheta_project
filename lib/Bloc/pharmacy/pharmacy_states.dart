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

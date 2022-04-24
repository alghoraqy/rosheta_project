abstract class PharmacyStates {}

class PharmacyInitialStates extends PharmacyStates {}

class PharmacyChangeBotNavStates extends PharmacyStates {}

class PharmacyRadioCheckState extends PharmacyStates {}

class GetAllDrugsSuccess extends PharmacyStates {}

class GetAllDrugsLoading extends PharmacyStates {}

class GetAllDrugsError extends PharmacyStates {
  final String error;
  GetAllDrugsError(this.error);
}

class GetPharmacyDataSuccess extends PharmacyStates {}

class GetPharmacyDataLoading extends PharmacyStates {}

class GetPharmacyDataError extends PharmacyStates {
  final String error;
  GetPharmacyDataError(this.error);
}

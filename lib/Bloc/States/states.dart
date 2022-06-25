abstract class UserStates {}

class InitStates extends UserStates {}

class ChageBottomNavState extends UserStates {}

class ChangeSpecial extends UserStates {}

class ChangePremium extends UserStates {}

class GetArticlesLoading extends UserStates {}

class GetArticlesSuccess extends UserStates {}

class GetArticlesError extends UserStates {
  final String error;
  GetArticlesError(this.error);
}

class GetUserDataLoading extends UserStates {}

class GetDistanceSuccess extends UserStates {}

class GetUserDataSuccess extends UserStates {}

class GetUserDataError extends UserStates {
  final String error;
  GetUserDataError(this.error);
}

class GetSearchDrugSuccess extends UserStates {}

class GetSearchDrugLoading extends UserStates {}

class GetSearchDrugError extends UserStates {
  final String error;
  GetSearchDrugError(this.error);
}

class GetAllPharmacyIdLoading extends UserStates {}

class GetAllPharmacyIdSuccess extends UserStates {}

class GetAllPharmacyIdError extends UserStates {
  final String error;
  GetAllPharmacyIdError(this.error);
}

class GetPharmacyDrugInDataLoading extends UserStates {}

class GetPharmacyDrugInDataSuccess extends UserStates {}

class GetPharmacyDrugInDataError extends UserStates {}

class UpdateUserDataSuccess extends UserStates {}

class UpdateUserDataError extends UserStates {}

class UpdateUserDataLoading extends UserStates {}

class SignOutSuccessUser extends UserStates {}

class GetImagePickedSuccess extends UserStates {}

class GetImagePickedError extends UserStates {}

class GetTextSuccess extends UserStates {}

class TryAgain extends UserStates {}

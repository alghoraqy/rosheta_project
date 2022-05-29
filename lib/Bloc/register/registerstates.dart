abstract class RegisterStates {}

class InitRegisterStates extends RegisterStates {}

class Changeuser extends RegisterStates {}

class ChangePharmacy extends RegisterStates {}

class Changetimer extends RegisterStates {}

class Changeradio extends RegisterStates {}

class ChangeCheck extends RegisterStates {}

class RadioChangeCheck extends RegisterStates {}

class RegisterSuccessStates extends RegisterStates {}

class RegisterErrorStates extends RegisterStates {
  final String error;
  RegisterErrorStates(this.error);
}

class CreateSuccessStates extends RegisterStates {
  final String uId;
  CreateSuccessStates(this.uId);
}

class CreateSuccessStates2 extends RegisterStates {
  final String uId;
  CreateSuccessStates2(this.uId);
}

class CreateSuccessStates3 extends RegisterStates {
  final String uId;
  CreateSuccessStates3(this.uId);
}

class CreateErrorStates extends RegisterStates {}

class CreateSuccessStates4 extends RegisterStates {
  final String uId;
  CreateSuccessStates4(this.uId);
}



class GetAllDrugsSuccess extends RegisterStates {}

class GetAllDrugsLoading extends RegisterStates {}

class GetAllDrugsError extends RegisterStates {
  final String error;
  GetAllDrugsError(this.error);
}

class PutDrugsLoading extends RegisterStates {}

class PutDrugsSuccess extends RegisterStates {}

class PutDrugsError extends RegisterStates {}



class GetDrugUidSuccess extends RegisterStates {}

class GetDrugUidError extends RegisterStates {}

class UploadeDrugsUidSuccess extends RegisterStates {}

class UploadeDrugsUidError extends RegisterStates {}

class Getprofileimagesuccess extends RegisterStates {}

class GetprofileimageLoading extends RegisterStates {}

class GetprofileimageError extends RegisterStates {}

class UploadeProfileImageSuccess extends RegisterStates {}

class UploadeProfileImageLoading extends RegisterStates {}

class UploadeProfileImageError extends RegisterStates {}

class UpdateimageSuccess extends RegisterStates {}

class UpdateimageError extends RegisterStates {}

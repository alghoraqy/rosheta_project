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

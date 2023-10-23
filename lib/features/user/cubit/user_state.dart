abstract class UserState {}

class UserInitial extends UserState {}

class GetUserLoading extends UserState {}

class GetUserSuccess extends UserState {}

class GetUserError extends UserState {
  final String message;

  GetUserError(this.message);
}

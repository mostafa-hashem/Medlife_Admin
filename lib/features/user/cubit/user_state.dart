abstract class UserState {}

class UserInitial extends UserState {}

class GetUsersLoading extends UserState {}

class GetUsersSuccess extends UserState {}

class GetUsersError extends UserState {
  final String message;

  GetUsersError(this.message);
}

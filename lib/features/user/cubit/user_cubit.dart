import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlife_v2/features/user/cubit/user_state.dart';
import 'package:medlife_v2/features/user/data/models/user.dart';
import 'package:medlife_v2/features/user/data/services/user_firebase_service.dart';
import 'package:medlife_v2/utils/data/failure/failure.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  static UserCubit get(BuildContext context) => BlocProvider.of(context);

  final _userFirebaseService = UserFirebaseService();
  List<User> users = [];

  Future<void> getUsers() async {
    emit(GetUsersLoading());
    try {
      users = await _userFirebaseService.getUsers();
      emit(GetUsersSuccess());
    } catch (e) {
      emit(GetUsersError(Failure.fromException(e).message));
    }
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlife_v2/features/user/cubit/user_state.dart';
import 'package:medlife_v2/features/user/data/services/user_firebase_service.dart';
import '../../../utils/data/failure/failure.dart';
import '../data/models/user.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  static UserCubit get(BuildContext context) => BlocProvider.of(context);

  final userFirebaseService = UserFirebaseService();
  late List<User> users;

  Future<void> getUsers() async {
    emit(GetUserLoading());
    try {
      users = await userFirebaseService.getUsers();
      emit(GetUserSuccess());
    } catch (e) {
      emit(GetUserError(Failure.fromException(e).message));
    }
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:medlife_v2/features/vendor/cubit/vendor_state.dart';
import 'package:medlife_v2/features/vendor/data/models/vendor.dart';
import 'package:medlife_v2/features/vendor/data/services/vendor_firebase_service.dart';
import '../../../utils/data/failure/failure.dart';

class VendorCubit extends Cubit<VendorState> {
  VendorCubit() : super(VendorInitial());

  static VendorCubit get(BuildContext context) => BlocProvider.of(context);

  final vendorFirebaseService = VendorFirebaseService();
  late List<Vendor> vendors;

  Future<void> getVendors() async {
    emit(GetVendorLoading());
    try {
      vendors = await vendorFirebaseService.geVendors();
      emit(GetVendorSuccess());
    } catch (e) {
      emit(GetVendorError(Failure.fromException(e).message));
    }
  }
}

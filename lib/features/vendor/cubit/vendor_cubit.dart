import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:medlife_v2/features/vendor/cubit/vendor_state.dart';
import 'package:medlife_v2/features/vendor/data/models/vendor.dart';
import 'package:medlife_v2/features/vendor/data/services/vendor_firebase_service.dart';
import 'package:medlife_v2/utils/data/failure/failure.dart';

class VendorCubit extends Cubit<VendorState> {
  VendorCubit() : super(VendorInitial());

  static VendorCubit get(BuildContext context) => BlocProvider.of(context);

  final _vendorFirebaseService = VendorFirebaseService();
  List<Vendor> vendors = [];
  late final Vendor mostOrdersVendor;

  Future<void> getVendors() async {
    emit(GetVendorsLoading());
    try {
      vendors = await _vendorFirebaseService.geVendors();
      emit(GetVendorsSuccess());
    } catch (e) {
      emit(GetVendorsError(Failure.fromException(e).message));
    }
  }

  Future<void> getMostOrdersVendor() async {
    emit(GetMostOrdersVendorLoading());
    try {
      mostOrdersVendor = await _vendorFirebaseService.getMostOrdersVendor();
      emit(GetMostOrdersVendorSuccess());
    } catch (e) {
      emit(GetMostOrdersVendorError(Failure.fromException(e).message));
    }
  }
}

abstract class VendorState {}

class VendorInitial extends VendorState {}

class GetVendorLoading extends VendorState {}

class GetVendorSuccess extends VendorState {}

class GetVendorError extends VendorState {
  final String message;

  GetVendorError(this.message);
}

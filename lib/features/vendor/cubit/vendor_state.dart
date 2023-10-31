abstract class VendorState {}

class VendorInitial extends VendorState {}

class GetVendorsLoading extends VendorState {}

class GetVendorsSuccess extends VendorState {}

class GetVendorsError extends VendorState {
  final String message;

  GetVendorsError(this.message);
}

class GetMostOrdersVendorLoading extends VendorState {}

class GetMostOrdersVendorSuccess extends VendorState {}

class GetMostOrdersVendorError extends VendorState {
  final String message;

  GetMostOrdersVendorError(this.message);
}

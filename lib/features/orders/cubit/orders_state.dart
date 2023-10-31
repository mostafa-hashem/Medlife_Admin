abstract class OrdersState {}

class OrdersInitial extends OrdersState {}

class GetAllOrdersLoading extends OrdersState {}

class GetAllOrdersSuccess extends OrdersState {}

class GetAllOrdersError extends OrdersState {
  final String message;

  GetAllOrdersError(this.message);
}

class GetPendingOrdersLoading extends OrdersState {}

class GetPendingOrdersSuccess extends OrdersState {}

class GetPendingOrdersError extends OrdersState {
  final String message;

  GetPendingOrdersError(this.message);
}

class GetAcceptOrderLoading extends OrdersState {}

class GetAcceptOrderSuccess extends OrdersState {}

class GetAcceptOrderError extends OrdersState {
  final String message;

  GetAcceptOrderError(this.message);
}

class GetDeliveredOrdersLoading extends OrdersState {}

class GetDeliveredOrdersSuccess extends OrdersState {}

class GetDeliveredOrdersError extends OrdersState {
  final String message;

  GetDeliveredOrdersError(this.message);
}

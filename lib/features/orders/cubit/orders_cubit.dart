import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlife_v2/features/orders/cubit/orders_state.dart';
import 'package:medlife_v2/features/orders/data/models/order.dart';
import 'package:medlife_v2/features/orders/data/services/orders_firebase_service.dart';
import 'package:medlife_v2/utils/data/failure/failure.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit() : super(OrdersInitial());

  static OrdersCubit get(BuildContext context) =>
      BlocProvider.of<OrdersCubit>(context);

  final _ordersFirebaseService = OrdersFirebaseService();
  List<Order> allOrders = [];
  List<Order> pendingOrders = [];
  List<Order> acceptedOrders = [];
  List<Order> deliveredOrders = [];

  Future<void> getAllOrders() async {
    emit(GetAllOrdersLoading());
    try {
      allOrders = await _ordersFirebaseService.getOrders();
      emit(GetAllOrdersSuccess());
    } catch (e) {
      emit(GetAllOrdersError(Failure.fromException(e).message));
    }
  }

  Future<void> getPendingOrders() async {
    emit(GetPendingOrdersLoading());
    try {
      await Future.delayed(const Duration(seconds: 1));
      pendingOrders =
          allOrders.where((order) => order.status == 'Pending').toList();
      emit(GetPendingOrdersSuccess());
    } catch (e) {
      emit(GetPendingOrdersError(Failure.fromException(e).message));
    }
  }

  Future<void> getAcceptedOrder() async {
    emit(GetAcceptOrderLoading());
    try {
      await Future.delayed(const Duration(seconds: 1));
      acceptedOrders =
          allOrders.where((order) => order.status == 'Accepted').toList();
      emit(GetAcceptOrderSuccess());
    } catch (e) {
      emit(GetAcceptOrderError(Failure.fromException(e).message));
    }
  }

  Future<void> getDeliveredOrders() async {
    emit(GetDeliveredOrdersLoading());
    try {
      await Future.delayed(const Duration(seconds: 1));
      deliveredOrders =
          allOrders.where((order) => order.status == 'Delivered').toList();
      emit(GetDeliveredOrdersSuccess());
    } catch (e) {
      emit(GetDeliveredOrdersError(Failure.fromException(e).message));
    }
  }
}

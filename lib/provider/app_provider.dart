import 'package:jamas_web/helpers/enumerators.dart';

import 'package:jamas_web/services/orders.dart';
import 'package:flutter/material.dart';

import '../models/orders.dart';

class AppProvider with ChangeNotifier {
  DisplayedPage currentPage;
  OrderServices _orderServices = OrderServices();
  OrderModel _orderModel;
  double revenue = 0;

  AppProvider.init() {
    _getRevenue();
    changeCurrentPage(DisplayedPage.HOME);
  }

  changeCurrentPage(DisplayedPage newPage) {
    currentPage = newPage;
    notifyListeners();
  }

  void _getRevenue() async {
    await _orderServices.getAllOrders().then((orders) {
      for (OrderModel order in orders) {
        revenue = revenue + order.total;
        print("======= TOTAL REVENUE: ${revenue.toString()}");
        print("======= TOTAL REVENUE: ${revenue.toString()}");
        print("======= TOTAL REVENUE: ${revenue.toString()}");
      }
      notifyListeners();
    });
  }
}

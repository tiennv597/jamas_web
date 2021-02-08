import 'package:jamas_web/main.dart';
import 'package:jamas_web/pages/brands/brands_page.dart';
import 'package:jamas_web/pages/categories/categories_page.dart';
import 'package:jamas_web/pages/login/login.dart';
import 'package:jamas_web/pages/questions/questions_add_page.dart';
import 'package:jamas_web/pages/questions/questions_page.dart';
import 'package:jamas_web/pages/registration/registration.dart';
import 'package:jamas_web/widgets/layout/layout.dart';
import '../pages/home/home_page.dart';
import '../pages/orders/orders_page.dart';
import '../pages/products/products_page.dart';
import '../pages/users/users_page.dart';
import 'package:jamas_web/rounting/route_names.dart';
import 'package:flutter/material.dart';

import 'route_names.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  print('generateRoute: ${settings.name}');
  switch (settings.name) {
    case HomeRoute:
      return _getPageRoute(HomePage());
    case UsersRoute:
      return _getPageRoute(UsersPage());
    case ProductsRoute:
      return _getPageRoute(ProductsPage());
    case LoginRoute:
      return _getPageRoute(LoginPage());
    case RegistrationRoute:
      return _getPageRoute(RegistrationPage());
    case LayoutRoute:
      return _getPageRoute(LayoutTemplate());
    case CategoriesRoute:
      return _getPageRoute(CategoriesPage());
    case BrandsRoute:
      return _getPageRoute(BrandsPage());
    case PageControllerRoute:
      return _getPageRoute(AppPagesController());
    case QuestionsRoute:
      return _getPageRoute(QuestionsPage());
    case QuestionAddRoute:
      return _getPageRoute(QuestionAddPage());
    default:
      return _getPageRoute(LoginPage());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(
    builder: (context) => child,
  );
}

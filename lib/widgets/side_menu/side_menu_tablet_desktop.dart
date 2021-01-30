import 'package:jamas_web/helpers/enumerators.dart';
import 'package:jamas_web/locator.dart';
import 'package:jamas_web/pages/categories/categories_page.dart';
import 'package:jamas_web/provider/app_provider.dart';
import 'package:jamas_web/rounting/route_names.dart';
import 'package:jamas_web/services/navigation_service.dart';
import 'package:jamas_web/widgets/navbar/navbar_logo.dart';
import 'package:jamas_web/widgets/side_menu/side_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../pages/brands/brands_page.dart';

class SideMenuTabletDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppProvider appProvider = Provider.of<AppProvider>(context);
    return Container(
      decoration: BoxDecoration(
          color: Colors.indigo,
          gradient: LinearGradient(
            colors: [Colors.indigo, Colors.indigo.shade600],
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.grey[200], offset: Offset(3, 5), blurRadius: 17)
          ]),
      width: 250,
      child: Container(
        child: Column(
          children: [
            NavBarLogo(),
            SideMenuItemDesktop(
              icon: Icons.dashboard,
              text: 'Dashboard',
              active: appProvider.currentPage == DisplayedPage.HOME,
              onTap: () {
                appProvider.changeCurrentPage(DisplayedPage.HOME);
                locator<NavigationService>().navigateTo(HomeRoute);
              },
            ),
            SideMenuItemDesktop(
              icon: Icons.people,
              text: 'Users',
              active: appProvider.currentPage == DisplayedPage.USERS,
              onTap: () {
                appProvider.changeCurrentPage(DisplayedPage.USERS);

                locator<NavigationService>().navigateTo(UsersRoute);
              },
            ),
            SideMenuItemDesktop(
              icon: Icons.shopping_cart,
              text: 'Orders',
              active: appProvider.currentPage == DisplayedPage.ORDERS,
              onTap: () {
                appProvider.changeCurrentPage(DisplayedPage.ORDERS);
                locator<NavigationService>().navigateTo(OrdersRoute);
              },
            ),
            SideMenuItemDesktop(
              icon: Icons.shopping_basket_outlined,
              text: 'Products',
              active: appProvider.currentPage == DisplayedPage.PRODUCTS,
              onTap: () {
                appProvider.changeCurrentPage(DisplayedPage.PRODUCTS);
                locator<NavigationService>().navigateTo(ProductsRoute);
              },
            ),
            SideMenuItemDesktop(
              icon: Icons.category,
              text: 'Categories',
              active: appProvider.currentPage == DisplayedPage.CATEGORIES,
              onTap: () {
                appProvider.changeCurrentPage(DisplayedPage.CATEGORIES);
                locator<NavigationService>().navigateTo(CategoriesRoute);
              },
            ),
            SideMenuItemDesktop(
              icon: Icons.category,
              text: 'Brands',
              active: appProvider.currentPage == DisplayedPage.BRANDS,
              onTap: () {
                appProvider.changeCurrentPage(DisplayedPage.BRANDS);
                locator<NavigationService>().navigateTo(BrandsRoute);
              },
            ),
            SideMenuItemDesktop(
              icon: Icons.category,
              text: 'Questions',
              active: appProvider.currentPage == DisplayedPage.QUESTIONS,
              onTap: () {
                appProvider.changeCurrentPage(DisplayedPage.QUESTIONS);
              locator<NavigationService>().navigateTo(QuestionsRoute);
              },
            ),
          ],
        ),
      ),
    );
  }
}

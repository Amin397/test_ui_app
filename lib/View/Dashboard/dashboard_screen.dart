import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/Controller/Dashboard/dashboard_controller.dart';
import 'package:testapp/View/Cart/cart_screen.dart';
import 'package:testapp/View/Dashboard/Widgets/build_bottom_navigator_widget.dart';
import 'package:testapp/View/Favorite/favorite_screen.dart';
import 'package:testapp/View/Home/home_screen.dart';
import 'package:testapp/View/Profile/profile_screen.dart';


class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});
  Size? size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: size!.height,
        width: size!.width,
        child: _buildPageView(),
      ),
      bottomNavigationBar: BuildBottomNavigatorWidget(),
    );
  }

  Widget _buildPageView() {
    return Consumer<DashboardController>(
      builder: (BuildContext context , DashboardController controller , child){
        switch (controller.currentPage) {
          case 0:
            {
              return HomeScreen();
            }
          case 1:
            {
              return FavoriteScreen();
            }
          case 2:
            {
              return CartScreen();
            }
          default:
            {
              return ProfileScreen();
            }
        }
      },
    );
  }
}

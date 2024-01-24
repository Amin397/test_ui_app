import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/Consts/measures.dart';
import 'package:testapp/Controller/Dashboard/dashboard_controller.dart';

class BuildBottomNavigatorWidget extends StatelessWidget {
  BuildBottomNavigatorWidget({super.key});

  Size? size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Container(
      width: size!.width,
      height: size!.height * .1,
      color: Colors.grey[200],
      child: Column(
        children: [
          _buildBar(),
          Expanded(
            child: SizedBox(
              width: size!.width,
              height: double.maxFinite,
              child: Row(
                children: [
                  _buildBottomItem(
                    index: 0,
                    title: 'Home',
                    icon: Icons.home_filled,
                  ),
                  _buildBottomItem(
                    index: 1,
                    title: 'Favorite',
                    icon: Icons.favorite,
                  ),
                  _buildBottomItem(
                    index: 2,
                    title: 'Cart',
                    icon: Icons.add_shopping_cart,
                  ),
                  _buildBottomItem(
                    index: 3,
                    title: 'Profile',
                    icon: Icons.account_circle_outlined,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBar() {
    double? leftPadding;
    double? rightPadding;
    return SizedBox(
      width: size!.width,
      height: size!.height * .007,
      child: Stack(
        children: [
          Consumer<DashboardController>(
            builder: (BuildContext context, DashboardController controller, child) {
              switch (controller.currentPage) {
                case 0:
                  {
                    leftPadding = size!.width * .05;
                    rightPadding = size!.width * .05;
                    break;
                  }
                case 1:
                  {
                    leftPadding = size!.width * .305;
                    rightPadding = size!.width * .05;
                    break;
                  }
                case 2:
                  {
                    leftPadding = size!.width * .55;
                    rightPadding = size!.width * .05;
                    break;
                  }

                default:
                  {
                    leftPadding = size!.width * .8;
                    rightPadding = size!.width * .05;
                    break;
                  }
              }

              return AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                width: size!.width * .15,
                margin: EdgeInsets.only(
                  left: leftPadding!,
                  right: rightPadding!,
                ),
                height: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: radiusAll16,
                  color: mainColor,
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildBottomItem({
    required int index,
    required String title,
    required IconData icon,
  }) {
    return Flexible(
      flex: 1,
      child: Consumer<DashboardController>(
        builder: (BuildContext context, DashboardController controller, child) {
          return InkWell(
            onTap: () {
              controller.changePage(index: index);
            },
            child: SizedBox(
              width: double.maxFinite,
              height: double.maxFinite,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    size: 30.0,
                    color: (controller.currentPage == index)
                        ? mainColor
                        : Colors.grey[400],
                  ),
                  const SizedBox(
                    height: 4.0,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      color: (controller.currentPage == index)
                          ? mainColor
                          : Colors.grey[400],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

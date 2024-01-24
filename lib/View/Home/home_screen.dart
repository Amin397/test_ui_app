import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/Consts/measures.dart';
import 'package:testapp/Controller/Home/home_controller.dart';
import 'package:testapp/Utils/widget_utils.dart';
import 'package:testapp/View/Dashboard/Widgets/build_top_part_widget.dart';
import 'package:testapp/View/Home/Widgets/build_category_widgets.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  Size? size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Container(
      height: size!.height,
      width: size!.width,
      padding: paddingSymmetricH35,
      child: Column(
        children: [
          BuildTopPartWidget(),
          SizedBox(
            height: size!.height * .01,
          ),
          Consumer<HomeController>(
            builder: (context, HomeController controller, child) {
              return animationConfig(
                widget: myTextField(
                  width: size!.width,
                  height: size!.height * .08,
                  hint: 'Search Coffee..',
                  controller: controller.searchTextController,
                  textStyle: const TextStyle(
                    fontSize: 16.0,
                  ),
                  suffix: Padding(
                    padding: paddingSymmetricH14,
                    child: Image.asset(
                      'assets/images/icons/fillter.png',
                    ),
                  ),
                  prefix: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.search,
                      color: Colors.grey[500],
                    ),
                  ),
                ),
                index: 2,
              );
            },
          ),
          Expanded(
            child: SizedBox(
              height: double.maxFinite,
              width: size!.width,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(
                      height: size!.height * .04,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: animationConfig(
                        widget: const Text(
                          'Categories',
                          style: TextStyle(
                            fontSize: 24.0,
                          ),
                        ),
                        index: 2,
                      ),
                    ),
                    SizedBox(
                      height: size!.height * .02,
                    ),
                    BuildCategoryWidgets(),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

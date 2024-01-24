import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/Consts/measures.dart';
import 'package:testapp/Controller/Home/home_controller.dart';
import 'package:testapp/Model/Category/category_model.dart';
import 'package:testapp/Utils/widget_utils.dart';
import 'package:testapp/View/Home/Widgets/build_category_item_widget.dart';

class BuildCategoryWidgets extends StatelessWidget {
  BuildCategoryWidgets({super.key});

  Size? size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.sizeOf(context);
    return SizedBox(
      height: size!.height * .38,
      width: size!.width,
      child: Column(
        children: [
          animationConfig(
            widget: _buildCategoryList(),
            index: 3,
          ),
          SizedBox(
            height: size!.height * .01,
          ),
          animationConfig(
            widget: BuildProductListWidget(),
            index: 3,
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryList() {
    return SizedBox(
      width: size!.width,
      height: size!.height * .07,
      child: Consumer<HomeController>(
        builder: (context, HomeController controller, child) {
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: controller.categoryList.length,
            itemBuilder: (BuildContext context, int index) {
              CategoryModel category = controller.categoryList[index];
              return InkWell(
                onTap: () {
                  controller.selectCategory(
                    category: category,
                  );
                },
                customBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 370),
                  margin: EdgeInsets.symmetric(
                    horizontal: size!.width * .02,
                    vertical: size!.height * .015,
                  ),
                  padding: paddingSymmetricH8,
                  height: double.maxFinite,
                  decoration: BoxDecoration(
                    color: (category.isSelected!) ? mainColor : Colors.white,
                    borderRadius: radiusAll50,
                    boxShadow: (category.isSelected!) ? shadow() : [],
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        category.icon!,
                        color: (category.isSelected!)
                            ? Colors.white
                            : Colors.black45,
                      ),
                      SizedBox(
                        width: size!.width * .02,
                      ),
                      Text(
                        category.title!,
                        style: TextStyle(
                          fontSize: 16.0,
                          color: (category.isSelected!)
                              ? Colors.white
                              : Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

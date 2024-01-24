import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/Consts/measures.dart';
import 'package:testapp/Controller/Intro/intro_controller.dart';
import 'package:testapp/Utils/widget_utils.dart';

class IntroScreen extends StatelessWidget {
  IntroScreen({super.key, this.size});

  Size? size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: Consumer<IntroController>(
        builder: (BuildContext context, IntroController ctx, child) {
          return SizedBox(
            height: size!.height,
            width: size!.width,
            child: Stack(
              children: [
                _buildBg(),
                Container(
                  height: size!.height,
                  width: size!.width,
                  decoration: const BoxDecoration(
                    color: Colors.black38,
                  ),
                ),
                _buildTextAndButton(
                  controller: ctx,
                  context: context,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildBg() {
    return SizedBox(
      height: size!.height,
      width: size!.width,
      child: Image.asset(
        'assets/images/introImg.jpg',
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildTextAndButton({
    required IntroController controller,
    required BuildContext context,
  }) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        width: size!.width,
        height: size!.height * .4,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.end,
          children: [
            animationConfig(
              widget: _buildCenterTexts(
                text: 'Good coffee',
              ),
              index: 2,
            ),
            // const SizedBox(
            //   height: 8.0,
            // ),
            animationConfig(
              widget: _buildCenterTexts(
                text: 'Good friends',
              ),
              index: 3,
            ),
            // const SizedBox(
            //   height: 8.0,
            // ),
            animationConfig(
              widget: _buildCenterTexts(
                text: 'let it blends',
              ),
              index: 4,
            ),
            const SizedBox(
              height: 20.0,
            ),
            animationConfig(
              widget: const Text(
                'The best grain, the finest roats,\nthe most powerful flavor',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
              index: 5,
            ),
            SizedBox(
              height: size!.height * .05,
            ),
            animationConfig(
              widget: _buildStartButton(
                controller: controller,
                context: context,
              ),
              index: 6,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCenterTexts({
    required String text,
  }) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 36.0,
      ),
    );
  }

  Widget _buildStartButton({
    required IntroController controller,
    required BuildContext context,
  }) {
    return InkWell(
      onTap: () {
        controller.goToHome(
          context:context,
        );
      },
      child: Container(
        width: size!.width * .65,
        height: size!.height * .07,
        decoration: BoxDecoration(
          color: mainColor,
          borderRadius: radiusAll42,
          boxShadow: shadow(),
        ),
        child: const Center(
          child: Text(
            'Get Started',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24.0,
            ),
          ),
        ),
      ),
    );
  }
}

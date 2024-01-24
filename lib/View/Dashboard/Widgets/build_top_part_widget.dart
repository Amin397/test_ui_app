import 'package:flutter/material.dart';
import 'package:testapp/Consts/measures.dart';
import 'package:testapp/Utils/widget_utils.dart';

class BuildTopPartWidget extends StatelessWidget {
  BuildTopPartWidget({super.key});

  Size? size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return SizedBox(
      width: size!.width,
      height: size!.height * .22,
      // padding: paddingSymmetricH24,
      child: Column(
        children: [
          Flexible(
            flex: 2,
            child: SafeArea(
              child: animationConfig(
                widget: SizedBox(
                  width: size!.width,
                  height: double.maxFinite,
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/person.png',
                      ),
                      Expanded(
                        child: Container(
                          width: double.maxFinite,
                          height: double.maxFinite,
                          margin: paddingSymmetricH20,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.location_on_rounded,
                                color: mainColor,
                              ),
                              const Text(
                                'Bintara, Bekasi',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Image.asset(
                        'assets/images/icons/notifIcon.png',
                      ),
                    ],
                  ),
                ),
                index: 1,
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: animationConfig(
              widget: SizedBox(
                width: size!.width,
                height: double.maxFinite,
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Good morning, Dityo',
                    style: TextStyle(
                      fontSize: 28.0,
                    ),
                  ),
                ),
              ),
              index: 1,
            ),
          )
        ],
      ),
    );
  }
}

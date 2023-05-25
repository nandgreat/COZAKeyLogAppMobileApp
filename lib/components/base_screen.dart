import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../res/color_palette.dart';
import '../res/images.dart';
import '../utils/helpers.dart';
import 'app_bar.dart';

class BaseScreen extends StatelessWidget {
  BaseScreen(
      {Key? key,
      this.title,
      this.child,
      this.showBackBtn = true,
      this.onPress,
      this.useToolBar = true,
      this.leftIcon,
      this.rightIcon})
      : super(key: key);
  final Widget? child;
  final VoidCallback? onPress;
  final String? title;
  final Widget? leftIcon;
  final Widget? rightIcon;
  final bool? showBackBtn;
  final bool useToolBar;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: deviceHeight(context),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 30.0,
              ),
              Container(
                height: deviceHeight(context) * 0.6,
                width: deviceWidth(context),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(BACKGROUND_DOTTED_CIRCLE),
                        fit: BoxFit.fitHeight)),
              ),
            ],
          ),
          Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(top: useToolBar ? 60.0 : 0.0),
                      child: child ?? Container(),
                    ),
                  ),
                ),
              ),
            ],
          ),
          useToolBar
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: useToolBar
                      ? CustomAppBar(
                          title: title ?? "",
                          showBackBtn: showBackBtn,
                          rightIcon: rightIcon,
                          leftIcon: leftIcon ??
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: primaryColor),
                                    borderRadius: BorderRadius.circular(12.0)),
                                child: const Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Icon(CupertinoIcons.back),
                                ),
                              ),
                          leftOnPress: onPress ?? () => Get.back())
                      : Container(),
                )
              : Container(),
        ],
      ),
    );
  }
}

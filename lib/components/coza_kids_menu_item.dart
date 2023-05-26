import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class COZAKidsMenuItem extends StatelessWidget {
  final String headerTitle;
  final Color color;
  final String iconImage;
  final VoidCallback? onPressed;

  const COZAKidsMenuItem(
      {Key? key,
      required this.headerTitle,
      this.onPressed,
      required this.color,
      required this.iconImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment:MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          iconImage,
                          height: 60.0,
                          width: 60.0,
                        ),
                        Text(
                          headerTitle,
                          style: const TextStyle(fontSize: 12.0, color: Colors.white)
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

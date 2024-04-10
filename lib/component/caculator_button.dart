import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../theme/size_config.dart';

class CalculatorButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final Color bgColor;
  final Color textColor;
  final bool isCircleShape;

  const CalculatorButton(
      {super.key,
      required this.text,
      required this.bgColor,
      required this.textColor,
      this.isCircleShape = true,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isCircleShape
          ? 10 * SizeConfig.heightMultiplier
          : 20 * SizeConfig.heightMultiplier,
      height: 12 * SizeConfig.heightMultiplier,
      child: ElevatedButton(
          onPressed: onPressed ?? () {},
          style: ElevatedButton.styleFrom(
              alignment: isCircleShape ? null : Alignment.centerLeft,
              padding: isCircleShape
                  ? const EdgeInsets.all(0)
                  : EdgeInsets.only(left: 5 * SizeConfig.widthMultiplier),
              backgroundColor: bgColor,
              shape: isCircleShape ? const CircleBorder() : null),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: textStyle(
                color: textColor,
                fontSize: 4 * SizeConfig.heightMultiplier,
                fontWeight: FontWeight.w500),
          )),
    );
  }
}

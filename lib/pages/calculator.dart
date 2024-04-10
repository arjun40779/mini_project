import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:math_expressions/math_expressions.dart';

import '../component/caculator_button.dart';
import '../theme/app_theme.dart';
import '../theme/size_config.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _displayValue = '0';

  void _onPressed(String buttonText) {
    setState(() {
      if (buttonText == 'AC') {
        _displayValue = '0';
      } else if (buttonText == '+/-') {
        // Handle negation
        if (_displayValue.startsWith('-')) {
          _displayValue = _displayValue.substring(1);
        } else {
          _displayValue = '-$_displayValue';
        }
      } else if (buttonText == '%') {
        // Handle percentage
        double value = double.parse(_displayValue) / 100;
        _displayValue = value.toString();
      } else if (buttonText == '=') {
        // Handle the evaluation of expression
        try {
          String result = Parser()
              .parse(_displayValue)
              .evaluate(EvaluationType.REAL, ContextModel())
              .toString();
          _displayValue = result;
        } catch (e) {
          // Handle error
          _displayValue = 'Error';
        }
      } else {
        // Append digits or operators to the display value
        if (_displayValue == '0') {
          _displayValue = buttonText;
        } else {
          _displayValue += buttonText;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(2 * SizeConfig.heightMultiplier),
        alignment: Alignment.bottomLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.all(2 * SizeConfig.heightMultiplier),
              alignment: Alignment.bottomRight,
              child: Text(_displayValue,
                  style: textStyle(
                      fontSize: 7 * SizeConfig.heightMultiplier,
                      color: AppColors.black,
                      fontWeight: FontWeight.w400)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CalculatorButton(
                    text: "AC",
                    onPressed: () {
                      _onPressed("AC");
                    },
                    bgColor: AppColors.lightGrey,
                    textColor: AppColors.white),
                CalculatorButton(
                    text: "+/-",
                    onPressed: () {
                      _onPressed("+/-");
                    },
                    bgColor: AppColors.lightGrey,
                    textColor: AppColors.white),
                CalculatorButton(
                    text: "%",
                    onPressed: () {
                      _onPressed("%");
                    },
                    bgColor: AppColors.lightGrey,
                    textColor: AppColors.white),
                CalculatorButton(
                  text: "÷",
                  onPressed: () {
                    _onPressed("/");
                  },
                  bgColor: AppColors.orange,
                  textColor: AppColors.white,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CalculatorButton(
                    text: "7",
                    onPressed: () {
                      _onPressed("7");
                    },
                    bgColor: AppColors.darkGrey,
                    textColor: AppColors.white),
                CalculatorButton(
                    text: "8",
                    onPressed: () {
                      _onPressed("8");
                    },
                    bgColor: AppColors.darkGrey,
                    textColor: AppColors.white),
                CalculatorButton(
                    text: "9",
                    onPressed: () {
                      _onPressed("9");
                    },
                    bgColor: AppColors.darkGrey,
                    textColor: AppColors.white),
                CalculatorButton(
                  text: "×",
                  onPressed: () {
                    _onPressed("*");
                  },
                  bgColor: AppColors.orange,
                  textColor: AppColors.white,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CalculatorButton(
                    text: "4",
                    onPressed: () {
                      _onPressed("4");
                    },
                    bgColor: AppColors.darkGrey,
                    textColor: AppColors.white),
                CalculatorButton(
                    text: "5",
                    onPressed: () {
                      _onPressed("5");
                    },
                    bgColor: AppColors.darkGrey,
                    textColor: AppColors.white),
                CalculatorButton(
                    text: "6",
                    onPressed: () {
                      _onPressed("6");
                    },
                    bgColor: AppColors.darkGrey,
                    textColor: AppColors.white),
                CalculatorButton(
                  text: "-",
                  onPressed: () {
                    _onPressed("-");
                  },
                  bgColor: AppColors.orange,
                  textColor: AppColors.white,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CalculatorButton(
                    text: "1",
                    onPressed: () {
                      _onPressed("1");
                    },
                    bgColor: AppColors.darkGrey,
                    textColor: AppColors.white),
                CalculatorButton(
                    text: "2",
                    onPressed: () {
                      _onPressed("2");
                    },
                    bgColor: AppColors.darkGrey,
                    textColor: AppColors.white),
                CalculatorButton(
                    text: "3",
                    onPressed: () {
                      _onPressed("3");
                    },
                    bgColor: AppColors.darkGrey,
                    textColor: AppColors.white),
                CalculatorButton(
                  text: "+",
                  onPressed: () {
                    _onPressed("+");
                  },
                  bgColor: AppColors.orange,
                  textColor: AppColors.white,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CalculatorButton(
                    text: "0",
                    onPressed: () {
                      _onPressed("0");
                    },
                    isCircleShape: false,
                    bgColor: AppColors.darkGrey,
                    textColor: AppColors.white),
                CalculatorButton(
                    text: ".",
                    onPressed: () {
                      _onPressed(".");
                    },
                    bgColor: AppColors.darkGrey,
                    textColor: AppColors.white),
                CalculatorButton(
                  text: "=",
                  onPressed: () {
                    _onPressed("=");
                  },
                  bgColor: AppColors.orange,
                  textColor: AppColors.white,
                ),
              ],
            )
          ],
        ));
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../theme/app_theme.dart';
import '../theme/size_config.dart';

class ClockPage extends StatefulWidget {
  const ClockPage({super.key});

  @override
  State<ClockPage> createState() => _ClockPageState();
}

class _ClockPageState extends State<ClockPage> {
  final TextStyle _clockTextStyle = textStyle(
      fontSize: 10 * SizeConfig.textMultiplier, color: AppColors.white);
  final EdgeInsets _containerPadding = EdgeInsets.symmetric(
    vertical: 7 * SizeConfig.heightMultiplier,
    horizontal: 12 * SizeConfig.widthMultiplier,
  );
  final LinearGradient _containerGradient = const LinearGradient(
    colors: [
      AppColors.lightBlue,
      AppColors.ligtPurple,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [0.0, 1.0],
  );
  final BorderRadius _containerBorderRadius =
      BorderRadius.circular(SizeConfig.heightMultiplier * 5);
  final double _containerWidth = 90 * SizeConfig.widthMultiplier;
  final Color _appBarBackgroundColor = AppColors.black;
  final Color _scafoldBackgroundColor = AppColors.darkGrey;
  final TextStyle _textStyle = textStyle(color: AppColors.white);
  late Timer _timer;
  late DateTime _now;
  late String _formattedTime;

  @override
  void initState() {
    super.initState();
    _updateTime(); //
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _updateTime();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _updateTime() {
    setState(() {
      _now = DateTime.now();
      _formattedTime = DateFormat('hh:mm:ss a').format(_now);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _appBarBackgroundColor,
        centerTitle: true,
        title: Text(
          "CLOCK",
          style: _textStyle,
        ),
      ),
      backgroundColor: _scafoldBackgroundColor,
      body: Center(
          child: Container(
              width: _containerWidth,
              padding: _containerPadding,
              decoration: BoxDecoration(
                  borderRadius: _containerBorderRadius,
                  gradient: _containerGradient),
              child: Text(_formattedTime, style: _clockTextStyle))),
    );
  }
}

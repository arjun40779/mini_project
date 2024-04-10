import 'package:flutter/material.dart';

import 'pages/home_page.dart';
import 'theme/size_config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Mini Project',
        home: HomePage());
  }
}

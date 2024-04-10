import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lazy_load_indexed_stack/lazy_load_indexed_stack.dart';

import 'calculator.dart';
import 'clock.dart';
import 'todo_list.dart';
import '../theme/app_theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 1;
  final _todoList = GlobalKey<NavigatorState>();
  final _clock = GlobalKey<NavigatorState>();
  final _calculator = GlobalKey<NavigatorState>();

  final Color _bottomNavBackgroundColor = AppColors.white;

  NavigatorState? _getCurrentNavigator() {
    switch (_currentIndex) {
      case 0:
        return _calculator.currentState;
      case 1:
        return _clock.currentState;
      case 2:
        return _todoList.currentState;
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LazyLoadIndexedStack(
        index: _currentIndex,
        children: [
          Navigator(
            key: _calculator,
            onGenerateRoute: (route) => MaterialPageRoute(
              settings: route,
              builder: (context) => const Calculator(),
            ),
          ),
          Navigator(
            key: _clock,
            onGenerateRoute: (route) => MaterialPageRoute(
              settings: route,
              builder: (context) => const ClockPage(),
            ),
          ),
          Navigator(
            key: _todoList,
            onGenerateRoute: (route) => MaterialPageRoute(
              settings: route,
              builder: (context) => const TodoList(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: _bottomNavBackgroundColor,
        currentIndex: _currentIndex,
        onTap: (index) {
          if (_currentIndex == index && _getCurrentNavigator()!.canPop()) {
            _getCurrentNavigator()!.popUntil((route) => route.isFirst);
          } else {
            setState(() {
              _currentIndex = index;
            });
          }
        },
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.calculator), label: 'calculator'),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.clock), label: 'clock'),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.listCheck), label: 'todo-list'),
        ],
      ),
    );
  }
}

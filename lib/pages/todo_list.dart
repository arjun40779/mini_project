import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/todo_model.dart';
import '../theme/app_theme.dart';
import '../theme/size_config.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  late List<Todos> todoList = [];

  final LinearGradient _todoTileGradient = const LinearGradient(
    colors: [
      Color.fromARGB(255, 180, 230, 244),
      Color.fromARGB(255, 255, 253, 196),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [0.0, 1.0],
  );
  final BorderRadius _todoTilesBorderRadius =
      BorderRadius.circular(SizeConfig.heightMultiplier * 2);
  final EdgeInsets _todoTilesMargin = EdgeInsets.symmetric(
      vertical: SizeConfig.heightMultiplier,
      horizontal: 3 * SizeConfig.widthMultiplier);
  final EdgeInsets _todoTilesPadding = EdgeInsets.symmetric(
      vertical: SizeConfig.heightMultiplier,
      horizontal: 3 * SizeConfig.widthMultiplier);
  final Color _scafoldBackgroundColor = AppColors.darkGrey;
  final Color _appBarBackgroundColor = AppColors.black;
  final TextStyle _appBarTextStyle = textStyle(color: AppColors.white);
  final double dialogboxwidth = 100 * SizeConfig.widthMultiplier;

  @override
  void initState() {
    super.initState();
    getLocalData();
  }

  void getLocalData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      String data = prefs.getString("todos") ?? "";
      final List<dynamic> list = jsonDecode(data);
      setState(() {
        todoList = Todos.fromJsonList(list);
      });
    } catch (e) {
      setState(() {
        todoList = [Todos(completed: false, text: "task1")];
      });
    }
  }

  void _updateLocalData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("todos", Todos.toJsonList(todoList));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _scafoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: _appBarBackgroundColor,
        centerTitle: true,
        title: Text(
          'Todo List',
          style: _appBarTextStyle,
        ),
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return _listTile(index);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddTodoDialog(context);
        },
        child: const FaIcon(FontAwesomeIcons.plus),
      ),
    );
  }

  Container _listTile(int index) {
    return Container(
      margin: _todoTilesMargin,
      padding: _todoTilesPadding,
      decoration: BoxDecoration(
          gradient: _todoTileGradient, borderRadius: _todoTilesBorderRadius),
      child: ListTile(
        leading: Checkbox(
          value: todoList[index].completed,
          onChanged: (value) {
            setState(() {
              todoList[index].completed = value!;
            });
            _updateLocalData();
          },
        ),
        title: Text(todoList[index].text,
            style: todoList[index].completed
                ? const TextStyle(decoration: TextDecoration.lineThrough)
                : null),
        trailing: IconButton(
          icon: const FaIcon(FontAwesomeIcons.trashCan),
          onPressed: () {
            setState(() {
              todoList.removeAt(index);
            });
            _updateLocalData();
          },
        ),
      ),
    );
  }

  void _showAddTodoDialog(BuildContext context) {
    String newTodoText = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Todo'),
          content: SizedBox(
            width: dialogboxwidth,
            child: TextField(
              onChanged: (value) {
                newTodoText = value;
              },
              decoration: const InputDecoration(hintText: 'Enter todo'),
            ),
          ),
          actions: <Widget>[
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Cancel")),
            TextButton(
              onPressed: () {
                newTodoText = newTodoText.trim();
                if (newTodoText.isNotEmpty) {
                  todoList.add(Todos(completed: false, text: newTodoText));
                }

                Navigator.of(context).pop();

                setState(() {
                  _updateLocalData();
                });
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }
}

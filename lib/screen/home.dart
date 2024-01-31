import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:todo_app/const/colors.dart';
import 'package:todo_app/screen/add_note_screen.dart';
import 'package:todo_app/widgets/task_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool show = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColors,
      floatingActionButton: Visibility(
        visible: show,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => AddNoteScreen()));
          },
          backgroundColor: customGreen,
          child: Icon(Icons.add, size: 30),
        ),
      ),
      body: SafeArea(
        child: NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            if (notification.direction == ScrollDirection.forward) {
              setState(() {
                show = true;
              });
            }
            if (notification.direction == ScrollDirection.reverse) {
              setState(() {
                show = false;
              });
            }
            return true;
          },
          child: ListView.builder(
              itemCount: 15,
              itemBuilder: (context, index) {
                return TaskWidget();
              }),
        ),
      ),
    );
  }
}

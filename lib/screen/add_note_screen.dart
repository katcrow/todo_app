import 'package:flutter/material.dart';
import 'package:todo_app/const/colors.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({super.key});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  final title = TextEditingController();
  final subTitle = TextEditingController();

  FocusNode _focusTitle = FocusNode();
  FocusNode _focusSubTitle = FocusNode();
  int indexx = 0;

  @override
  void dispose() {
    title.dispose();
    subTitle.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColors,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            titleWidget(),
            SizedBox(height: 20),
            subTitleWidget(),
            SizedBox(height: 20),
            imagess(),
            SizedBox(height: 20),
            button(),
          ],
        ),
      ),
    );
  }

  Widget button() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: customGreen,
            minimumSize: Size(170, 48),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            // primary: customGreen,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Add Task', style: TextStyle(color: Colors.white)),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            minimumSize: Size(170, 48),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            // primary: customGreen,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Cancel', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }

  Widget imagess() {
    return Container(
      height: 180,
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => setState(() => indexx = index),
            child: Container(
              width: 140,
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 2, color: indexx == index ? customGreen : Colors.grey),
              ),
              child: Column(
                children: [
                  Image.asset("images/${index}.png"),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget titleWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextField(
          controller: title,
          focusNode: _focusTitle,
          style: TextStyle(fontSize: 18, color: Colors.black),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            hintText: 'title',
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Color(0xffc5c5c5), width: 2.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: customGreen, width: 2.0),
            ),
          ),
        ),
      ),
    );
  }

  Widget subTitleWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextField(
          maxLines: 3,
          controller: subTitle,
          focusNode: _focusSubTitle,
          style: TextStyle(fontSize: 18, color: Colors.black),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            hintText: 'sub title',
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Color(0xffc5c5c5), width: 2.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: customGreen, width: 2.0),
            ),
          ),
        ),
      ),
    );
  }
}

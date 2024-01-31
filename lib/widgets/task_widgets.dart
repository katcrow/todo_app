import 'package:flutter/material.dart';
import 'package:todo_app/const/colors.dart';

class TaskWidget extends StatefulWidget {
  const TaskWidget({super.key});

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

bool isDone = false;

class _TaskWidgetState extends State<TaskWidget> {
  @override
  Widget build(BuildContext context) {
    return get();
  }

  Widget get() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Container(
        width: double.infinity,
        height: 130,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              imageee(),
              SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Title', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        Checkbox(
                          value: isDone,
                          onChanged: (value) {
                            setState(() {
                              isDone = !isDone;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Text('sub Title', style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.grey.shade500)),
                    Spacer(),
                    editTime(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget editTime() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Container(
            width: 90,
            height: 28,
            decoration: BoxDecoration(color: customGreen, borderRadius: BorderRadius.circular(18)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              child: Row(
                children: [
                  Image.asset('images/icon_time.png'),
                  SizedBox(width: 10),
                  Text(
                    'time',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 10),
          Container(
            width: 90,
            height: 28,
            decoration: BoxDecoration(color: Color(0xffe2f6f1), borderRadius: BorderRadius.circular(18)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              child: Row(
                children: [
                  Image.asset('images/icon_edit.png'),
                  SizedBox(width: 10),
                  Text(
                    'edit',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget imageee() {
    return Container(
      height: 130,
      width: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(image: AssetImage('images/1.png'), fit: BoxFit.cover),
      ),
    );
  }
}

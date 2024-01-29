import 'package:flutter/material.dart';
import 'package:todo_app/const/colors.dart';
import 'package:todo_app/data/auth_data.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen(this.show, {super.key});
  final VoidCallback show;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FocusNode _focusEmail = FocusNode();
  FocusNode _focusPassword = FocusNode();

  final email = TextEditingController();
  final password = TextEditingController();

  @override
  void initState() {
    super.initState();
    _focusEmail.addListener(() {
      setState(() {});
    });
    _focusPassword.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColors,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              image(),
              SizedBox(height: 50),
              customTextField(controller: email, focusNode: _focusEmail, hintText: 'Email', iconData: Icons.email),
              SizedBox(height: 10),
              customTextField(controller: password, focusNode: _focusPassword, hintText: 'Password', iconData: Icons.password),
              SizedBox(height: 10),
              account(widget.show),
              SizedBox(height: 20),
              loginButton(email: email.text, password: password.text),
            ],
          ),
        ),
      ),
    );
  }
}

class account extends StatelessWidget {
  const account(this.show, {super.key});
  final VoidCallback show;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'Do not have an account?',
            style: TextStyle(color: Colors.grey[700], fontSize: 14),
          ),
          SizedBox(width: 10),
          GestureDetector(
            onTap: show,
            child: Text(
              'Sign Up',
              style: TextStyle(color: Colors.blue, fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

class loginButton extends StatelessWidget {
  const loginButton({
    super.key,
    required this.email,
    required this.password,
  });
  final String email;
  final String password;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: GestureDetector(
        onTap: () {
          AuthenticationRemote().login(email, password);
        },
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(color: customGreen, borderRadius: BorderRadius.circular(10)),
          child: Text(
            'Log In',
            style: TextStyle(color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class customTextField extends StatelessWidget {
  const customTextField({
    super.key,
    required this.controller,
    required FocusNode focusNode,
    required this.hintText,
    required this.iconData,
  }) : _focusNode = focusNode;

  final TextEditingController controller;
  final _focusNode;
  final String hintText;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextField(
          controller: controller,
          focusNode: _focusNode,
          style: TextStyle(fontSize: 18, color: Colors.black),
          decoration: InputDecoration(
            prefixIcon: Icon(
              iconData,
              color: _focusNode.hasFocus ? customGreen : Color(0xffc5c5c5), // todo
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            hintText: hintText,
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

class image extends StatelessWidget {
  const image({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        width: double.infinity,
        height: 300,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('images/7.png'), fit: BoxFit.cover),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:kun_todo_app/widgets/auth/sign_up.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: Color.fromRGBO(242, 242, 242, 1)),
        backgroundColor: Color.fromRGBO(242, 242, 242, 1),
        fontFamily: 'SFProDisplay'
      ),
      home: SignUpWidget()
    );
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kun_todo_app/widgets/auth/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        debugPrint('User is currently signed out!');
      } else {
        debugPrint('User is signed in!');
      }
    });
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            appBarTheme:
                AppBarTheme(backgroundColor: Color.fromRGBO(242, 242, 242, 1)),
            backgroundColor: Color.fromRGBO(242, 242, 242, 1),
            fontFamily: 'SFProDisplay'),
        home: SignUpWidget());
  }
}

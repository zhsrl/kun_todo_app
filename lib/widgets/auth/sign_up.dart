import 'package:flutter/material.dart';
// ignore: library_prefixes
import 'package:kun_todo_app/text.dart' as Consts;
// ignore: unused_import
import 'package:firebase_auth/firebase_auth.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({Key? key}) : super(key: key);

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(242, 242, 242, 1),
        appBar: AppBar(
          title: const Text(
            Consts.signUp,
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w700, fontSize: 20),
          ),
          elevation: 0,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 60),
          child: Stack(
            children: [
              _SignUpFormWidget(),
            ],
          ),
        ));
  }
}

class _SignUpFormWidget extends StatefulWidget {
  const _SignUpFormWidget({Key? key}) : super(key: key);

  @override
  State<_SignUpFormWidget> createState() => __SignUpFormWidgetState();
}

class __SignUpFormWidgetState extends State<_SignUpFormWidget> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> signUpWithFirebase(String email, String password) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        debugPrint('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        debugPrint('The account already exists for that email.');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    bool _obscureText = true;

    var nameInputDec = InputDecoration(
        isCollapsed: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        hintText: Consts.name,
        hintStyle: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Color(0xFFBDBDBD)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: Color(0xFF5DB075), width: 1.5)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFE8E8E8), width: 1.5),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))));

    var emailInputDec = InputDecoration(
        isCollapsed: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        hintText: Consts.email,
        hintStyle: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Color(0xFFBDBDBD)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: Color(0xFF5DB075), width: 1.5)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFE8E8E8), width: 1.5),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))));

    var passwordInputDec = InputDecoration(
        isCollapsed: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        hintText: Consts.password,
        hintStyle: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Color(0xFFBDBDBD)),
        suffix: GestureDetector(
            onTap: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
            child:
                Text(Consts.show, style: TextStyle(color: Color(0xFF5DB075)))),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: Color(0xFF5DB075), width: 1.5)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFE8E8E8), width: 1.5),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))));

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            TextField(
                controller: _nameController,
                decoration: nameInputDec,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            SizedBox(height: 16),
            TextField(
                controller: _emailController,
                decoration: emailInputDec,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              decoration: passwordInputDec,
              obscureText: _obscureText,
              enableSuggestions: false,
              autocorrect: false,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  var emailText = _emailController.text;
                  var passwordText = _passwordController.text;
                  signUpWithFirebase(emailText, passwordText);
                },
                child: Text(Consts.signUp,
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
                style: ElevatedButton.styleFrom(
                    primary: Color(0xFF5DB075),
                    shadowColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    elevation: 0,
                    minimumSize: Size.fromHeight(50))),
            SizedBox(
              height: 16,
            ),
            GestureDetector(
              onTap: () {
                final snackBar = SnackBar(
                  content: Text('Snack'),
                );

                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: Text(Consts.haveAccount,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Consts.mainColor,
                      fontSize: 16)),
            )
          ],
        ),
      ],
    );
  }
}

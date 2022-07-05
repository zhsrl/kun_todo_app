import 'package:flutter/material.dart';
// ignore: library_prefixes
import 'package:kun_todo_app/text.dart' as ConstText;

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
        title:const Text(
          ConstText.signUp,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 20),),
        elevation: 0,
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Stack(
          children: [
            _SignUpFormWidget(),

            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                
                onPressed: (){
            
                },
                child: Text(ConstText.signUp),
                
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF5DB075),
                  elevation: 0,
                  minimumSize: Size.fromHeight(50)
            ),
            
            ),
        )
          ],
        ),
      )
    );
  }
}

class _SignUpFormWidget extends StatefulWidget {
  const _SignUpFormWidget({Key? key}) : super(key: key);

  @override
  State<_SignUpFormWidget> createState() => __SignUpFormWidgetState();
}

class __SignUpFormWidgetState extends State<_SignUpFormWidget> {
  @override
  Widget build(BuildContext context) {
    bool _obscureText = true;

    var nameInputDec = InputDecoration(
            isCollapsed: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            hintText: ConstText.name,
            hintStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Color(0xFFBDBDBD)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(color: Color(0xFF5DB075), width: 1.5)),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFE8E8E8), width: 1.5),
              borderRadius: BorderRadius.all(Radius.circular(8))
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8))));

    var emailInputDec = InputDecoration(
            isCollapsed: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            hintText: ConstText.email,
            hintStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Color(0xFFBDBDBD)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(color: Color(0xFF5DB075), width: 1.5)),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFE8E8E8), width: 1.5),
              borderRadius: BorderRadius.all(Radius.circular(8))
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8))
            ));

    var passwordInputDec = InputDecoration(
            isCollapsed: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            hintText: ConstText.password,
            hintStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Color(0xFFBDBDBD)),

            suffix: GestureDetector(
              onTap: (){
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
              child: Text(
                ConstText.show,
                style: TextStyle(
                  color: Color(0xFF5DB075)))
              ),

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(color: Color(0xFF5DB075), width: 1.5)),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFE8E8E8), width: 1.5),
              borderRadius: BorderRadius.all(Radius.circular(8))
            ),
            
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8))
            ));


    return Column(
      children: [

        TextField(
          
          decoration: nameInputDec,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)
        ),

        SizedBox(height: 16),

        TextField(
          decoration: emailInputDec,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)
        ),

        SizedBox(height: 16),

        TextField(
          decoration: passwordInputDec,
          obscureText: _obscureText,
          enableSuggestions: false,
          autocorrect: false,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),


      ],
    );
  }
}

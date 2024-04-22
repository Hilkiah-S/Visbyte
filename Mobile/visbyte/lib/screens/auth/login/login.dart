import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dart:convert';

import 'package:visbyte/screens/dashboard.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late bool timefingerprint;
  bool text1 = false;
  bool text2 = false;

  late TextEditingController emailtext;
  late TextEditingController password;

  // String val="";

  Color colortt = Colors.white;
  Color changeColor = Colors.deepOrange;
  String change(value) {
    setState(() {
      colortt = changeColor;
    });
    return value;
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext fcontext) {
        return AlertDialog(
          title: const Text('Either username or password is incorrect'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Icon(
                  Icons.error,
                  color: Colors.red,
                  size: 120,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Try again'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  bool isButtonActive = true;
  // late TextEditingController password;
  // late TextEditingController emailtext;

  @override
  void initState() {
    super.initState();

    _passwordVisible = false;
    emailtext = TextEditingController();
    emailtext.addListener(() {
      final text1 = emailtext.text.isNotEmpty;
    });
    password = TextEditingController();
    password.addListener(() {
      final text2 = emailtext.text.isNotEmpty;
    });

    if (text1 == true && text2 == true) {
      isButtonActive = true;
    }
// if(_mybox.get(35)==1){
// setState(() {
//   timefingerprint=true;
// });
// }
  }

  // @override
  // void dispose(){
  //   emailtext.dispose();
  //   password.dispose();
  //   super.dispose();
  // }
  bool _passwordVisible = false;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // SizedBox(height: MediaQuery.of(context).size.height * 0.1),

              Container(
                  width: 80,
                  height: 200,
                  child: Image.asset(
                    'assets/logo/logo.png',
                    fit: BoxFit.cover,
                  )),
              SizedBox(height: 48),

              TextFormField(
                controller: emailtext,
                style: TextStyle(color: Colors.white70),
                decoration: InputDecoration(
                  hintText: "Enter your email",
                  hintStyle: TextStyle(color: Colors.white54),
                  filled: true,
                  fillColor: Colors.grey[800],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: Icon(Icons.email, color: Colors.deepOrange),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 24),

              TextFormField(
                controller: password,
                obscureText: !_passwordVisible,
                style: TextStyle(color: Colors.white70),
                decoration: InputDecoration(
                  hintText: "Password",
                  hintStyle: TextStyle(color: Colors.white54),
                  filled: true,
                  fillColor: Colors.grey[800],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon:
                      Icon(Icons.lock_outline, color: Colors.deepOrange),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.deepOrange,
                    ),
                    onPressed: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 32),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                ),
                child: Text(
                  "Login",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Dashboard()));
                },
              ),

              SizedBox(height: 32),

              Row(
                children: [
                  Expanded(child: Divider(color: Colors.white24)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text("OR", style: TextStyle(color: Colors.white54)),
                  ),
                  Expanded(child: Divider(color: Colors.white24)),
                ],
              ),

              SizedBox(height: 32),

              GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.fingerprint,
                  size: 64,
                  color: Colors.deepOrange,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Touch ID",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white54, fontSize: 16),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            ],
          ),
        ),
      ),
    );
  }

  // void _loginUser() async {
  //   if (password.text.isNotEmpty && emailtext.text.isNotEmpty) {
  //     Response<Map<String, dynamic>> response = await Dio().post(
  //         "https://berhan.addisphoenix.com/endpoint.php",
  //         data: {
  //           "email": emailtext.text,
  //           "password": password.text,
  //         },
  //         options:
  //             new Options(contentType: "application/x-www-form-urlencoded"));

  //     var success = response.data;
  //     print(success);
  //     /*
  //   ['error'=> true/false, 'msg'=>  String]
  //   */

  //     if (success?["error"]) {
  //       _showMyDialog();
  //       return;
  //     }
  //     _mybox.put(70, 1);
  //     _mybox.put(80, emailtext.text);
  //     _mybox.put(90, password.text);

  //     Navigator.of(context)
  //         .push(MaterialPageRoute(builder: (context) => Debuding()));
  //     //logined in
  //     //Naviage erlvome
  //   }
  // }
}

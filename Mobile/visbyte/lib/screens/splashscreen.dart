import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:rive/rive.dart' hide LinearGradient;
import 'package:visbyte/screens/auth/login/login.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Artboard? riveArtboard;
  SMIBool? isHover;
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Login()));
    });
    rootBundle.load('assets/my_avatar.riv').then((data) async {
      try {
        final file = RiveFile.import(data);
        final artboard = file.mainArtboard;
        var controller = StateMachineController.fromArtboard(artboard, 'birb');
        if (controller != null) {
          artboard.addController(controller);
          isHover = controller.findSMI('Hover');
        }
        setState(() => riveArtboard = artboard);
      } catch (e) {
        print(e);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            gradient:
                //  LinearGradient(
                //   begin: Alignment.topRight,
                //   end: Alignment.bottomLeft,
                //   colors: [Colors.orangeAccent, Colors.deepOrange],
                //   // colors: [Color.fromARGB(255, 35, 35, 35), Colors.black],
                // ),
                LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color.fromARGB(255, 31, 29, 29)!, // Light grey color
            Color.fromARGB(255, 31, 29, 29)!, // Much darker shade of grey
          ],
        )),
        child: Center(
          child:
              // Image.asset('assets/logo/logo.png')
              SizedBox(
            width: 300,
            height: 400,
            child: RiveAnimation.asset(
              'assets/rive/flame_rivetober.riv',
              fit: BoxFit.cover,

              // This will cover the circle area
            ),
          ),
        ),
      ),
    );
  }
}

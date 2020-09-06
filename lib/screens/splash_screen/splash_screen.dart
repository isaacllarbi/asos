import 'package:asos/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

class AsosSplashScreen extends StatefulWidget {
  @override
  _AsosSplashScreenState createState() => _AsosSplashScreenState();
}

class _AsosSplashScreenState extends State<AsosSplashScreen> {
  @override
  void initState() {
    openHomeScreen();
    super.initState();
  }

  openHomeScreen() async {
    var duration = Duration(milliseconds: 1500);
    Future.delayed(
      duration,
      () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (ctx) => AsosHomeScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'asos',
                style: TextStyle(
                    fontSize: 85,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -6.2),
              ),
              SizedBox(height: 30),
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.black),
              )
            ],
          ),
        ),
      ),
    );
  }
}

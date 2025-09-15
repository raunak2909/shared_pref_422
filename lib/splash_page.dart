import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_pref_422/app_constants.dart';
import 'package:shared_pref_422/home_page.dart';
import 'package:shared_pref_422/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 2), () async{

      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool isLogin = prefs.getBool(AppConstants.prefLoginKey) ?? false;

      Widget nextPage = isLogin ? HomePage() : LoginPage();

      /*if(isLogin){
        nextPage = HomePage();
      }*/

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => nextPage),
      );



    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterLogo(size: 200),
            SizedBox(height: 11),
            Text(
              "Classico",
              style: TextStyle(fontSize: 70, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

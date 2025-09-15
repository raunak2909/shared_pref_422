import 'package:flutter/material.dart';
import 'package:shared_pref_422/app_constants.dart';
import 'package:shared_pref_422/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Hi, Welcome back..",
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 11),
            TextField(
              decoration: InputDecoration(
                hintText: "Email",
                labelText: "Enter email here..",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(21),
                ),
              ),
            ),
            SizedBox(height: 11),
            TextField(
              decoration: InputDecoration(
                hintText: "Password",
                labelText: "Enter password here..",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(21),
                ),
              ),
            ),
            SizedBox(height: 11),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async{

                  ///authentication logic here

                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  prefs.setBool(AppConstants.prefLoginKey, true);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                child: Text("Login"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

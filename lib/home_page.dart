import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController nameController = TextEditingController();
  final String nameKey = "name";

  String name = "";

  SharedPreferences? prefs;

  @override
  void initState() {
    super.initState();
    getNameFromPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: StatefulBuilder(
            builder: (context, ss) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  name.isNotEmpty ? Text("Welcome, $name", style: TextStyle(fontSize: 21),) : Container(),
                  SizedBox(
                    child: TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter your name',
                        labelText: "Name"
                      ),
                    ),
                  ),
                  ElevatedButton(onPressed: (){
                    /// to save value in prefs
                    name = nameController.text;
                    ss(() {});
                    saveNameInPrefs();
                  }, child: Text('Save'))
                ],
              );
            }
          ),
        ),
      ),
    );
  }

  void getNameFromPrefs() async{
    prefs = await SharedPreferences.getInstance();
    name = prefs!.getString(nameKey) ?? "";
    print("name: $name");
    setState(() {

    });
  }

  void saveNameInPrefs(){
    prefs!.setString(nameKey, nameController.text);
  }
}

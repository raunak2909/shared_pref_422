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

  int count = 0;

  Color bgColor = Colors.white;

  @override
  void initState() {
    super.initState();
    initPrefs();
  }

  initPrefs() async{
    prefs = await SharedPreferences.getInstance();
    updateCount();
    getNameFromPrefs();
  }

  updateCount() async{
    count = prefs!.getInt("count") ?? 0;
    count++;
    if(count%5 == 0 && count%3 == 0){
      bgColor = Colors.amber.shade200;
    } else if(count%5 == 0){
      bgColor = Colors.green.shade200;
    } else if(count%3 == 0){
      bgColor = Colors.blue.shade200;
    }
    prefs!.setInt("count", count);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: bgColor,
            /*child: Center(
              child: Text("$count", style: TextStyle(fontSize: 200, fontWeight: FontWeight.bold, color: Colors.black26),),
            ),*/
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: StatefulBuilder(
                builder: (context, ss) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      name.isNotEmpty ? Text("स्वागत, $name", style: TextStyle(fontSize: 21),) : Container(),
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
        ],
      ),
    );
  }

  void getNameFromPrefs() async{
    name = prefs!.getString(nameKey) ?? "";
    print("name: $name");
    setState(() {

    });
  }

  void saveNameInPrefs(){
    prefs!.setString(nameKey, nameController.text);
  }
}

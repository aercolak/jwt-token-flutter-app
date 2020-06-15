import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'view/loginPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JWT TOKEN FLUTTER APP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {


SharedPreferences sharedPreferences;

@override
void initState(){
  super.initState();
  checkLoginStatus();
}

checkLoginStatus() async{
  sharedPreferences = await SharedPreferences.getInstance();
  if(sharedPreferences.getString("token") == null){
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (BuildContext context) => LoginPage()),
        (Route<dynamic> route) => false
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JWT TOKEN'),
        actions: <Widget>[
          FlatButton(
            onPressed: (){
              sharedPreferences.clear();
              sharedPreferences.commit();
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (BuildContext context) => LoginPage()),
                      (Route<dynamic> route) => false
              );
            },
            child: Text('Logout'),
          ),
        ],
      ),
      body: Center(
        child: Text('Main Page'),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[

            UserAccountsDrawerHeader(
                accountName: Text('JWT'),
                accountEmail: Text('aercolak@gmail.com'),
            ),

            ListTile(
              title: Text('List Products'),
              trailing: Icon(Icons.list),
              onTap: (){},
            ),

            ListTile(
              title: Text('Add Products'),
              trailing: Icon(Icons.add),
              onTap: (){},
            ),

            ListTile(
              title: Text('Register User'),
              trailing: Icon(Icons.person_add),
              onTap: (){},
            ),

          ],
        ),
      ),
    );
  }
}


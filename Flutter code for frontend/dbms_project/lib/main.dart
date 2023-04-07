import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';

import 'adminpage.dart';
import 'homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var conn;
  Future<void> connect() async {
    var settings = new ConnectionSettings(
        host: 'localhost',
        port: 3306,
        user: 'root',
        password: 'takelite123',
        db: 'college_allotment_system'
    );
    conn = await MySqlConnection.connect(settings);
  }
  var results;
  Future<String> check()
  async {
    connect();
    var userId = 1;
    results = await conn.query('select BITSAT_ID, name from student where id = 1001');
    print(results);
    return results;
  }


  late final TextEditingController id;
  late final TextEditingController name;
  void initState() {
    id = TextEditingController();
    name = TextEditingController();
    // TODO: implement initState
    super.initState();
  }


  void dispose() {
    id.dispose();
    name.dispose(); // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        centerTitle: true,
        backgroundColor: Colors.green,
        title: Text('Login'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: id,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(hintText: 'Enter the BITSAT_ID'),
              ),
              TextField(
                obscureText: true,
                controller: name,
                decoration: InputDecoration(hintText: 'Enter the Name'),
              ),
              SizedBox(height:50),
              ElevatedButton(onPressed: () async{

                check();
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                        builder: (context) =>
                            homescreen()));

              },

                  child: Text('Login'),

              ),
              SizedBox(height: 20),
              ElevatedButton(onPressed: () async{

                check();
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                        builder: (context) =>
                            adminpage()));

              },

                child: Text('Admin Login'),

              ),
            ],

          )
        )
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

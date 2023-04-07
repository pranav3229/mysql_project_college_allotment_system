import 'package:flutter/material.dart';
import 'package:untitled/main.dart';
import 'package:untitled/preferencepage.dart';
import 'package:untitled/profilepage.dart';

import 'allotment.dart';
class homescreen extends StatefulWidget {
  const homescreen({Key? key}) : super(key: key);

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: ElevatedButton(
          onPressed: (){
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                    builder: (context) =>
                        MyHomePage(title: 'yeet')));
          },
          style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green)),
          child: Icon(Icons.logout),
        ),

        centerTitle: true,
        backgroundColor: Colors.green,
        title: Text('Please select an option'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(35),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: (){
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                        builder: (context) =>
                            preferencepage()));
              },
                  child: Text('Select Preference') ),
              SizedBox(height: 20),
              ElevatedButton(onPressed: (){
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                        builder: (context) =>
                            profilepage()));
              },
                  child: Text('Edit Profile') ),
              SizedBox(height: 20),
              ElevatedButton(onPressed: (){
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                        builder: (context) =>
                            allotment()));
              },
                  child: Text('View Allotment') ),
            ],
          )
        )
      )
    );
  }
}

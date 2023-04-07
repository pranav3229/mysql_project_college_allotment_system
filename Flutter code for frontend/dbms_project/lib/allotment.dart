import 'package:flutter/material.dart';

import 'homescreen.dart';
class allotment extends StatefulWidget {
  const allotment({Key? key}) : super(key: key);

  @override
  State<allotment> createState() => _allotmentState();
}

class _allotmentState extends State<allotment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: ElevatedButton(
          onPressed: (){
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                    builder: (context) =>
                        homescreen()));
          },
          style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green)),
          child: Icon(Icons.keyboard_return),
        ),


        centerTitle: true,
        backgroundColor: Colors.green,
        title: Text('Allotment Result'),
      ),
      body: Center(
        child: Container(
          child: Text('Congratulations you have been allotted BE Electrical and Electronics Engineering BITS Goa'),
        ),
      )
    );
  }
}

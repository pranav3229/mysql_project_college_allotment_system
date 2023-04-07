import 'package:flutter/material.dart';

import 'main.dart';
class adminpage extends StatefulWidget {
  const adminpage({Key? key}) : super(key: key);

  @override
  State<adminpage> createState() => _adminpageState();
}

class _adminpageState extends State<adminpage> {
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
                    // Navigator.of(context).pushReplacement(
                    //     MaterialPageRoute(
                    //         builder: (context) =>
                    //             preferencepage()));
                  },
                      child: Text('Retrieve Seat Allotment List') ),
                  SizedBox(height: 20),
                  ElevatedButton(onPressed: (){
                    // Navigator.of(context).pushReplacement(
                    //     MaterialPageRoute(
                    //         builder: (context) =>
                    //             profilepage()));
                  },
                      child: Text('Edit College List') ),
                  SizedBox(height: 20),
                  ElevatedButton(onPressed: (){
                    // Navigator.of(context).pushReplacement(
                    //     MaterialPageRoute(
                    //         builder: (context) =>
                    //             allotment()));
                  },
                      child: Text('Retrieve number of applications received for a particular college and course') ),
                  SizedBox(height: 20),
                  ElevatedButton(onPressed: (){
                    // Navigator.of(context).pushReplacement(
                    //     MaterialPageRoute(
                    //         builder: (context) =>
                    //             allotment()));
                  },
                      child: Text('Retrieve a list of all colleges that have filled all their seats') ),
                  SizedBox(height: 20),
                  ElevatedButton(onPressed: (){
                    // Navigator.of(context).pushReplacement(
                    //     MaterialPageRoute(
                    //         builder: (context) =>
                    //             allotment()));
                  },
                      child: Text('Retrieve a count of the number of seats available for a particular course in all colleges') ),

                ],
              )
          )
      )
    );
  }
}

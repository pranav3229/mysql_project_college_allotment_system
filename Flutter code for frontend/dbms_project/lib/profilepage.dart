import 'package:flutter/material.dart';
import 'package:untitled/homescreen.dart';
class profilepage extends StatefulWidget {
  const profilepage({Key? key}) : super(key: key);

  @override
  State<profilepage> createState() => _profilepageState();
}

class _profilepageState extends State<profilepage> {
  String dropdownValue = 'Choose an option';
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
          child: Icon(Icons.logout),
        ),

        centerTitle: true,
        backgroundColor: Colors.green,
        title: Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,

            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.center,
                        child: CircleAvatar(
                          radius: 80,
                          backgroundColor: Colors.black,
                          child: ClipOval(
                            // ignore: unnecessary_new
                            child: new SizedBox(
                              width: 180.0,
                              height: 240.0,
                              child: Container(
                                color: Colors.black,
                              )

                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(top: 150.0),
                            child: IconButton(
                              icon: Icon(
                                Icons.camera,
                                size: 25.0,
                                color: Colors.black38,
                              ),
                              onPressed: () {

                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Student Name: John Doe',
                      ),


                      validator: (String? value) {
                        return (value!.isEmpty)
                            ? 'This field is mandatory'
                            : null;
                      }),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Enter Student Phone Number: 1234567890',
                    ),
                    keyboardType: TextInputType.number,

                    validator: (String? value) {
                      if (value!.length != 10)
                      {return 'Enter Valid Phone Number';}

                    },

                    // onSaved: (String? value){
                    //   patient.patientPhoneNumber = value! as int;
                    // }, // Only numbers can be entered
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Enter Student Address: NULL',
                    ),
                    keyboardType: TextInputType.multiline,
                    validator: (String? value) {
                      return (value!.isEmpty)
                          ? 'This field is mandatory'
                          : null;
                    },
                    //   onSaved: (String? value){
                    //     patient.patientAddress = value!;
                    // }

                    // Only numbers can be entered
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Enter Student Date of Birth (DD-MM-YYYY): 12-12-2002',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a date';
                      }
                      final dateRegExp = RegExp(r'^(\d{2})-(\d{2})-(\d{4})$');
                      if (!dateRegExp.hasMatch(value)) {
                        return 'Please enter date in dd-mm-yyyy format';
                      }
                      return null;
                    },

                    //  onSaved: (String? value){
                    //     patient.patientDOB = value!;
                    // },
                  ),
                  DropdownButtonFormField(
                    decoration:
                    const InputDecoration(labelText: 'Enter Gender: Male'),
                    onChanged: (String? newValue) {

                      setState(() {
                        //print(newValue);
                        dropdownValue = newValue!;
                        //print(dropdownValue);

                      });
                    },
                    items: <String>['Male', 'Female', 'Others']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                          ));
                    }).toList(),
                    onSaved: (String? value) {

                    },
                    validator: (value) {
                      if (value == null) {
                        return 'Gender is required';
                      }
                    },
                  ),

                  SizedBox(height: 20),
                  SizedBox(
                    height: 50,
                    width: 125,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green),
                      ),
                      onPressed: () async {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Center(child: CircularProgressIndicator());
                          },
                        );
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: (context) =>
                                    homescreen()));

                        // print(uploadPic(imagefile));




                      },
                      child: const Text('Edit Info'),
                    ),
                  ),
                ],
              ),
            )),
      )
    );
  }
}

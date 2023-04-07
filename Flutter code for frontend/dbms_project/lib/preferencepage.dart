import 'package:flutter/material.dart';

import 'homescreen.dart';
class preferencepage extends StatefulWidget {
  const preferencepage({Key? key}) : super(key: key);

  @override
  State<preferencepage> createState() => _preferencepageState();
}

class _preferencepageState extends State<preferencepage> {
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
          child: Icon(Icons.keyboard_return),
        ),


        centerTitle: true,
        backgroundColor: Colors.green,
        title: Text('Please select an option'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
      child: Form(
        child: Column(
          children: <Widget>[
            DropdownButtonFormField(
              decoration:
              const InputDecoration(labelText: 'Enter Preference 1'),
              onChanged: (String? newValue) {

                setState(() {
                  //print(newValue);
                  dropdownValue = newValue!;
                  //print(dropdownValue);

                });
              },
              items: <String>['BE Computer Science BITS Pilani',
                'BE Electrical and Electronics Engineering BITS Goa',
                'BE Mechanical Engineering BITS Hyderabad',
                'BE Chemical Engineering BITS Pilani',
                'BE Electronics and Instrumentation Engineering BITS Goa',
                'BE Electrical and Electronics Engineering BITS Hyderabad',
                'BE Computer Science BITS Goa',
                'BE Mechanical Engineering BITS Pilani',
                'BE Computer Science BITS Hyderabad',
                'BE Electronics and Instrumentation Engineering BITS Pilani'
              ]
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
                  return 'Preference 1 is required';
                }
              },
            ),
            DropdownButtonFormField(
              decoration:
              const InputDecoration(labelText: 'Enter Preference 2'),
              onChanged: (String? newValue) {

                setState(() {
                  //print(newValue);
                  dropdownValue = newValue!;
                  //print(dropdownValue);

                });
              },
              items: <String>['BE Computer Science BITS Pilani',
                'BE Electrical and Electronics Engineering BITS Goa',
                'BE Mechanical Engineering BITS Hyderabad',
                'BE Chemical Engineering BITS Pilani',
                'BE Electronics and Instrumentation Engineering BITS Goa',
                'BE Electrical and Electronics Engineering BITS Hyderabad',
                'BE Computer Science BITS Goa',
                'BE Mechanical Engineering BITS Pilani',
                'BE Computer Science BITS Hyderabad',
                'BE Electronics and Instrumentation Engineering BITS Pilani'
              ]
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                    ));
              }).toList(),
              onSaved: (String? value) {

              },
              // validator: (value) {
              //   if (value == null) {
              //     return 'Gender is required';
              //   }
              // },
            ),
            DropdownButtonFormField(
              decoration:
              const InputDecoration(labelText: 'Enter Preference 3'),
              onChanged: (String? newValue) {

                setState(() {
                  //print(newValue);
                  dropdownValue = newValue!;
                  //print(dropdownValue);

                });
              },
              items: <String>['BE Computer Science BITS Pilani',
                'BE Electrical and Electronics Engineering BITS Goa',
                'BE Mechanical Engineering BITS Hyderabad',
                'BE Chemical Engineering BITS Pilani',
                'BE Electronics and Instrumentation Engineering BITS Goa',
                'BE Electrical and Electronics Engineering BITS Hyderabad',
                'BE Computer Science BITS Goa',
                'BE Mechanical Engineering BITS Pilani',
                'BE Computer Science BITS Hyderabad',
                'BE Electronics and Instrumentation Engineering BITS Pilani'
              ]
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                    ));
              }).toList(),
              onSaved: (String? value) {

              },
              // validator: (value) {
              //   if (value == null) {
              //     return 'Ge is required';
              //   }
              // },
            ),
            DropdownButtonFormField(
              decoration:
              const InputDecoration(labelText: 'Enter Preference 4'),
              onChanged: (String? newValue) {

                setState(() {
                  //print(newValue);
                  dropdownValue = newValue!;
                  //print(dropdownValue);

                });
              },
              items: <String>['BE Computer Science BITS Pilani',
                'BE Electrical and Electronics Engineering BITS Goa',
                'BE Mechanical Engineering BITS Hyderabad',
                'BE Chemical Engineering BITS Pilani',
                'BE Electronics and Instrumentation Engineering BITS Goa',
                'BE Electrical and Electronics Engineering BITS Hyderabad',
                'BE Computer Science BITS Goa',
                'BE Mechanical Engineering BITS Pilani',
                'BE Computer Science BITS Hyderabad',
                'BE Electronics and Instrumentation Engineering BITS Pilani'
              ]
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                    ));
              }).toList(),
              onSaved: (String? value) {

              },
              // validator: (value) {
              //   if (value == null) {
              //     return 'Ge is required';
              //   }
              // },
            ),
            DropdownButtonFormField(
              decoration:
              const InputDecoration(labelText: 'Enter Preference 5'),
              onChanged: (String? newValue) {

                setState(() {
                  //print(newValue);
                  dropdownValue = newValue!;
                  //print(dropdownValue);

                });
              },
              items: <String>['BE Computer Science BITS Pilani',
                'BE Electrical and Electronics Engineering BITS Goa',
                'BE Mechanical Engineering BITS Hyderabad',
                'BE Chemical Engineering BITS Pilani',
                'BE Electronics and Instrumentation Engineering BITS Goa',
                'BE Electrical and Electronics Engineering BITS Hyderabad',
                'BE Computer Science BITS Goa',
                'BE Mechanical Engineering BITS Pilani',
                'BE Computer Science BITS Hyderabad',
                'BE Electronics and Instrumentation Engineering BITS Pilani'
              ]
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                    ));
              }).toList(),
              onSaved: (String? value) {

              },
              // validator: (value) {
              //   if (value == null) {
              //     return 'Ge is required';
              //   }
              // },
            ),
          ],
        )

    )
      ),
    );
  }
}

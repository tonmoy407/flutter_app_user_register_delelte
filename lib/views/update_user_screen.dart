import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class UpdateUserScreen extends StatefulWidget {
  const UpdateUserScreen({super.key});

  @override
  State<UpdateUserScreen> createState() => _UpdateUserScreenState();
}



class _UpdateUserScreenState extends State<UpdateUserScreen> {
  TextEditingController first_nameEditingController = TextEditingController();
  TextEditingController last_nameEditingController = TextEditingController();
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController mobileNoEditingController = TextEditingController();
  TextEditingController addressEditingController = TextEditingController();
  TextEditingController  updateUserName = TextEditingController();
  String selectedGender = "";
  String first_nameOfUpdate = "";
  int succesChecker = 0;

  @override
  Widget build(BuildContext context) {
    void _showToastSucces(BuildContext context) {
      final scaffold = ScaffoldMessenger.of(context);
      scaffold.showSnackBar(
        SnackBar(
          content: const Text('User Deleted'),
        ),
      );
    };
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                autofocus: true,
                controller: updateUserName,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  labelText: "Enter first name of user to be updated",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25)
                  )
                ),
              ),
              SizedBox(height: 25,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      label: Text("First Name:"),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25))),
                  controller: first_nameEditingController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      label: Text("Last Name:"),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25))),
                  controller: last_nameEditingController,
                ),
              ),
              Column(
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Select Gender",
                          style: TextStyle(fontSize: 25),
                        ),
                      )),
                  RadioListTile(
                      title: Text("Male"),
                      value: "Male",
                      groupValue: selectedGender,
                      onChanged: (value) {
                        setState(() {
                          selectedGender = "Male";
                        });
                      }),
                  RadioListTile(
                      title: Text("Female"),
                      value: "Female",
                      groupValue: selectedGender,
                      onChanged: (value) {
                        setState(() {
                          selectedGender = "Female";
                        });
                      }),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      label: Text("Email"),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25))),
                  controller: emailEditingController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.numberWithOptions(),
                  decoration: InputDecoration(
                      label: Text("Mobile No"),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25))),
                  controller: mobileNoEditingController,
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: addressEditingController,
                    maxLines: 8,
                    decoration: InputDecoration.collapsed(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4)),
                        hintText: "Enter your address here"),
                  )),
              GestureDetector(
                onTap: (){
                  first_nameOfUpdate = updateUserName.text;
                  Future<void> postData() async {
                    var response = await http.patch(Uri.parse("http://192.168.0.105:3000/api/users/${first_nameOfUpdate}"), body: {
                      "first_name": first_nameEditingController.text,
                      "last_name": last_nameEditingController.text,
                      "email": emailEditingController.text,
                      "gender": selectedGender,
                      "mobileNo": mobileNoEditingController.text,
                      "address": addressEditingController.text
                    });
                    print(response.body);
                    if (response.statusCode == 201) {
                      succesChecker = 1;
                    } else {
                      succesChecker = 0;
                      _showToastSucces(context);
                    }
                  };
                  setState(() {
                    postData();
                  });

                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.amber
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Update", style: TextStyle(fontSize: 25),),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

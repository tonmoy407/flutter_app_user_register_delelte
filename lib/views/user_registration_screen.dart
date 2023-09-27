import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:user_registration_update_search_delete_etc/views/succesful_registration_screen.dart';

class UserRegistrationScreen extends StatefulWidget {
  const UserRegistrationScreen({super.key});

  @override
  State<UserRegistrationScreen> createState() => _UserRegistrationScreenState();
}

TextEditingController first_nameEditingController = TextEditingController();
TextEditingController last_nameEditingController = TextEditingController();
TextEditingController emailEditingController = TextEditingController();
TextEditingController mobileNoEditingController = TextEditingController();
TextEditingController addressEditingController = TextEditingController();

class _UserRegistrationScreenState extends State<UserRegistrationScreen> {
  String selectedGender = "";
  int succesChecker = 0;
  Future<void> postData() async {
    var response = await http
        .post(Uri.parse("http://192.168.0.105:3000/api/users/"), body: {
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
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registration"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
              onTap: () {
                postData();

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SuccesfulRegistrationPage(
                            firstName: first_nameEditingController.text,
                            lastName: last_nameEditingController.text,
                            address: addressEditingController.text,
                            email: emailEditingController.text,
                            gender: selectedGender,
                            mobileNo: mobileNoEditingController.text)));
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(25)),
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    "Register",
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:user_registration_update_search_delete_etc/views/home_screen.dart';

class SuccesfulRegistrationPage extends StatelessWidget {
  String firstName, lastName, email, mobileNo, address, gender;
  SuccesfulRegistrationPage(
      {super.key,
      required this.firstName,
      required this.lastName,
      required this.address,
      required this.email,
      required this.gender,
      required this.mobileNo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "User Registered Succesfully",
                style: TextStyle(fontSize: 18),
              ),
              Text(
                "Name: " + firstName + " " + lastName,
                style: TextStyle(fontSize: 18),
              ),
              Text(
                "Email: " + email,
                style: TextStyle(fontSize: 18),
              ),
              Text(
                "Mobile No: " + mobileNo,
                style: TextStyle(fontSize: 18),
              ),
              Text(
                "Gender: " + gender,
                style: TextStyle(fontSize: 18),
              ),
              Text(
                "Address: " + address,
                style: TextStyle(fontSize: 18),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Back to Home",
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
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

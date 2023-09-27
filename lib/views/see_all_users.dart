import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:user_registration_update_search_delete_etc/views/succesful_registration_screen.dart';
import '../models/user_model.dart';

class SeeAllUsersScreen extends StatefulWidget {
  const SeeAllUsersScreen({super.key});

  @override
  State<SeeAllUsersScreen> createState() => _SeeAllUsersScreenState();
}

class _SeeAllUsersScreenState extends State<SeeAllUsersScreen> {
  Future<UserModel> getUsersApi() async {
    var response =
        await http.get(Uri.parse("http://192.168.0.105:3000/api/users/"));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return UserModel.fromJson(data);
    } else {
      throw Exception(Error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getUsersApi(),
        builder: (BuildContext context, AsyncSnapshot<UserModel> snapShot) {
          if (snapShot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.downloading),
                ],
              ),
            );
          } else {
            return ListView.builder(
                itemCount: snapShot.data!.users!.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SuccesfulRegistrationPage(
                                  firstName: snapShot
                                      .data!.users![index].firstName
                                      .toString(),
                                  lastName: snapShot
                                      .data!.users![index].lastName
                                      .toString(),
                                  address: snapShot.data!.users![index].address
                                      .toString(),
                                  email: snapShot.data!.users![index].email
                                      .toString(),
                                  gender: snapShot.data!.users![index].gender
                                      .toString(),
                                  mobileNo: snapShot
                                      .data!.users![index].mobileNo
                                      .toString())));
                    },
                    child: Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Name:",
                            style: TextStyle(fontSize: 25),
                          ),
                          Row(
                            children: [
                              Text(
                                snapShot.data!.users![index].firstName
                                    .toString(),
                                style: TextStyle(fontSize: 25),
                              ),
                              Text(
                                " " +
                                    snapShot.data!.users![index].lastName!
                                        .toString(),
                                style: TextStyle(fontSize: 25),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                });
          }
        },
      ),
    );
  }
}

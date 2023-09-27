import 'package:flutter/material.dart';
import 'package:user_registration_update_search_delete_etc/views/delete_user_screen.dart';
import 'package:user_registration_update_search_delete_etc/views/search_user_screen.dart';
import 'package:user_registration_update_search_delete_etc/views/see_all_users.dart';
import 'package:user_registration_update_search_delete_etc/views/update_user_screen.dart';
import 'package:user_registration_update_search_delete_etc/views/user_registration_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Center(child: Text("Home Page")),
        ),
        body: Column(
          children: [
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const UserRegistrationScreen()));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.amber),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "User Registration",
                            style: TextStyle(fontSize: 25),
                          ),
                        ))),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> SeeAllUsersScreen()));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.amber),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "See All Users",
                            style: TextStyle(fontSize: 25),
                          ),
                        ))),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> SearchUserScreen()));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.amber),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Search a User",
                            style: TextStyle(fontSize: 25),
                          ),
                        ))),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const UpdateUserScreen()));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.amber),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Update a user",
                            style: TextStyle(fontSize: 25),
                          ),
                        ))),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> DeleteUserScreen()));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.amber),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Delete A User",
                            style: TextStyle(fontSize: 25),
                          ),
                        ))),
              ),
            ),
          ],
        ));
  }
}

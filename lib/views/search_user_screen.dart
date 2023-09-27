import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/search_user_model.dart';
class SearchUserScreen extends StatefulWidget {
  const SearchUserScreen({super.key});

  @override
  State<SearchUserScreen> createState() => _SearchUserScreenState();
}

class _SearchUserScreenState extends State<SearchUserScreen> {
  TextEditingController searchTextController = TextEditingController();
  String search = "";

  Future<SearchUserModel> getSearchUserAPI () async {
    var response = await http.get(Uri.parse("http://192.168.0.105:3000/api/users/${search}"));
    if(response.statusCode == 200){
      final data;
      data = jsonDecode(response.body);
      return SearchUserModel.fromJson(data);
    }else{
      throw Exception(Error);
    }
  }

  int dataCheck = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextFormField(

              autofocus: true,
              decoration: InputDecoration(
                fillColor: Colors.grey.shade100,
                focusColor: Colors.amber,
                filled: true,
                labelText: "Search Here By Name",
                border: OutlineInputBorder(
                  borderRadius: (BorderRadius.circular(25)),
                )
              ),
              controller: searchTextController,
            ),
            SizedBox(height: 36,),
            GestureDetector(
              onTap: (){
                search = searchTextController.text;
                setState(() {
                  dataCheck = 1;
                });

              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.amber
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Search", style: TextStyle(fontSize: 25),),
                ),
              ),
            ),
            dataCheck == 0 ? Text("") : Expanded(
              child: FutureBuilder(future: getSearchUserAPI(),

                  builder: (BuildContext context, AsyncSnapshot<SearchUserModel>snapShot){
                if(snapShot.connectionState == ConnectionState.waiting){
                  return const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.downloading),
                      ],
                    ),
                  );
                }
                else{
                  return ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, index){
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Name",style: TextStyle(fontSize: 25),),
                            Row(
                              children: [
                                Text(snapShot.data!.user!.firstName.toString() + " ",style: TextStyle(fontSize: 25),),
                                Text(snapShot.data!.user!.lastName.toString(),style: TextStyle(fontSize: 25),)

                              ],
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Email",style: TextStyle(fontSize: 25),),
                            Row(
                              children: [
                                Text(snapShot.data!.user!.email.toString(),style: TextStyle(fontSize: 25),)

                              ],
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Gender",style: TextStyle(fontSize: 25),),
                            Row(
                              children: [
                                Text(snapShot.data!.user!.gender.toString(),style: TextStyle(fontSize: 25),)

                              ],
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Mobile No",style: TextStyle(fontSize: 25),),
                            Row(
                              children: [
                                Text(snapShot.data!.user!.mobileNo.toString(),style: TextStyle(fontSize: 25),)

                              ],
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Address",style: TextStyle(fontSize: 25),),
                            Row(
                              children: [
                                Text(snapShot.data!.user!.firstName.toString() + " ",style: TextStyle(fontSize: 25),),
                                Text(snapShot.data!.user!.lastName.toString(),style: TextStyle(fontSize: 25),)
                              ],
                            )
                          ],
                        ),
                      ],
                    );
                  });
                }
                  }),
            )
          ],
        ),
      ),
    );
  }
}
